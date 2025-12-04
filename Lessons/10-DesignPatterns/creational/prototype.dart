import 'helper_functions.dart';

typedef Side = (Direction, MapSite?);

// Interface for things that can be cloned
abstract class Cloneable<T>{
  T clone();
}

// Interface For Products like (Room, Wall, Door)
abstract class MapSite<T> implements Cloneable<T>{
  void enter();
}

class Room implements MapSite<Room>{
  late final int roomNo;
  
  List<Side> _sides = [(Direction.north, null),(Direction.east, null),
                       (Direction.south, null),(Direction.west, null)];
  
  List<Side> get sides => _sides;
  
  
  Room();

  // initialize separates internal state from object creation
  void initialize(int roomNo) => this.roomNo = roomNo;
  
  @override
  String toString(){
    // defensive coding practice for debug printing late variables
    try {
      return 'Room(roomNo: $roomNo)';
    } catch (e) {
      return 'Room(Uninitialized)';
    }
  }

  void enter(){
     // TODO: implement method
  }
  
  Room clone() => Room().._sides = List.from(this._sides);
  
  void setSide(Direction direction, MapSite element){
    final index = _sides.indexWhere((side) => side.$1 == direction);
    if(index != -1){
      _sides[index] = (direction, element);
    }
  }

 MapSite? getSide(Direction direction){
    final record = _sides.firstWhere((side) => side.$1 == direction, // find the first matching record
                                     orElse: ()=> (direction, null)); // orElse return default
    return record.$2;
  }
}

class Door implements MapSite<Door> {
  late final Room r1;
  late final Room r2;
  bool isOpen = true;

  Door();

  void initialize(Room r1, Room r2, [bool? isOpen]){
      if (r1 == r2) {
      throw Exception('A door cannot connect a room to itself.');
    }
    this.r1 = r1;
    this.r2 = r2;
    this.isOpen = isOpen != null ? isOpen : this.isOpen;
  }

  void enter(){}

  Door clone() => Door()..isOpen = this.isOpen;

}

class Wall implements MapSite<Wall> {
  Wall();

  @override // @override can be omitted as in the above Products (Classes)
  void enter() {}

  @override
  Wall clone() => Wall();
  
}

class Spell {
  final name;
  Spell({required this.name});

  @override
  String toString() => 'Spell(name: $name)';
}

class EnchantedRoom extends Room{
  static final List<Spell> _roomSpells = [Spell(name:'Enhanced map'), Spell(name:'Intangibility'), Spell(name:'Unlock IV')];
  late final Spell activeSpell;
  
  EnchantedRoom();

  @override
  void initialize(int roomNo) => this..roomNo = roomNo..activeSpell = getRandom([for(int i = 0; i < _roomSpells.length; i++) _roomSpells[i]]);

  @override
  EnchantedRoom clone() => EnchantedRoom();

  @override
  String toString() => 'Room(roomNo: $roomNo, activeSpell: $activeSpell)';
}

class Maze implements Cloneable<Maze>{
  List<Room> _rooms = [];

  List<Room> get rooms => _rooms;

  Maze clone() => Maze();

  void addRoom(Room room){
    final isDuplicateRoomNo = _rooms.any((r) => r.roomNo == room.roomNo);
    if(!isDuplicateRoomNo){
      _rooms.add(room);
    } else {
      throw Exception('$room is already a current room in the maze.');
    }
  }

  int getNextRoomId() => _rooms.isEmpty ? 1 : _rooms.last.roomNo + 1;
}

class MazeFactory {
  final Maze _prototypeMaze;
  final Room _prototypeRoom;
  final Wall _prototypeWall;
  final Door _prototypeDoor;
  
  MazeFactory({required Maze maze, required Room room,
               required Door door, required Wall wall}):_prototypeMaze = maze,
                                                        _prototypeRoom = room,
                                                        _prototypeWall = wall,
                                                        _prototypeDoor = door;

  Maze makeMaze() => _prototypeMaze.clone();
  
  Wall makeWall() => _prototypeWall.clone();

  Room makeRoom(int roomNo) => _prototypeRoom.clone()..initialize(roomNo);

  Door makeDoor(Room r1, Room r2) => _prototypeDoor.clone()..initialize(r1, r2); // using the Cascade operator to remove the need for temporary variables
}

class MazeGame {
  static Maze createMaze({required MazeFactory mazeFactory}){
    final maze = mazeFactory.makeMaze();
    
    final r1 = mazeFactory.makeRoom(maze.getNextRoomId());
    maze.addRoom(r1); 

    final r2 = mazeFactory.makeRoom(maze.getNextRoomId());
    maze.addRoom(r2);

    final walls = [for(int i = 0; i < 6; i++) mazeFactory.makeWall()];

    final door = mazeFactory.makeDoor(r1, r2);

    r1.setSide(Direction.north, walls[0]);
    r1.setSide(Direction.east, door);
    r1.setSide(Direction.south, walls[1]);
    r1.setSide(Direction.west, walls[2]);

    r2.setSide(Direction.north, walls[3]);
    r2.setSide(Direction.east, walls[4]);
    r2.setSide(Direction.south, walls[5]);
    r2.setSide(Direction.west, door);

    return maze;
  }
}
void main(){
  final mazeFactory = MazeFactory(maze: Maze(), room: EnchantedRoom(), door: Door(), wall: Wall());
  final maze = MazeGame.createMaze(mazeFactory: mazeFactory);

  print("Maze created with ${maze.rooms.length} rooms.");
  
   for(var room in maze.rooms){
    print(room);
    print(room.sides);
  }
}

// Some SOLID principles covered in the sample code

  // Interface Segregation Principle (ISP) -  Segregating Interfaces

  //   - no class should implement methods it does not use
  //     as it is better to have many small interfaces rather
  //     than one general purpose interface

  // Separation of Concerns (Single Responsibility)

  //  - Decoupling:
  
  //    - Creation (clone): the clone method is responsible for structual copying of shared state
  
  //    - Configuration (initialize): initialization is resonsible for injecting unique state
  
  //    - Representation (_prototypeProduct/ class Product): the code that defines WHAT the object contains and HOW it holds data
  
  //       - NOTE: class Product is generic and means any object instance returned to the Client
  //               through means that are typically hidden from the Client (Factory Methods, Builders, Prototypes, etc)