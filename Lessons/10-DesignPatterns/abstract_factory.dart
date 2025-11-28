import 'dart:math';

enum Direction {north, south, east, west}

abstract class MapSite{
  void enter();
}

class Room extends MapSite{
  final int roomNo;
  static Set<int> _currentRoomNums = {};
  static get currentRoomNums => _currentRoomNums;

  List _sides = List.filled(4, 0);
  List get sides => _sides;

  Room({required this.roomNo}){
    if (!_currentRoomNums.contains(this.roomNo)){
      _currentRoomNums.add(this.roomNo);
    }
    else {
      throw Exception('$roomNo is already a current room number.');
    }
  }

  @override
  String toString() => 'Room(roomNo: $roomNo)';

  void enter(){
    // TODO: implement method
  }

  void setSide(Direction direction, MapSite element){
      for(var i=0; i < _sides.length; i++){
        if(_sides[i] == 0){
          _sides[i] = (direction, element);
          break;
        }
      }
  }

  MapSite? getSide(){
    // TODO: implement method
  }
}

class Spell {
  final name;
  Spell({required this.name});

  @override
  String toString() => 'Spell(name: $name)';
}

class EnchantedRoom extends Room{
  final Spell activeSpell;
  EnchantedRoom({
    required super.roomNo,
    required this.activeSpell
  });

  @override
  String toString() => 'Room(roomNo: $roomNo, activeSpell: $activeSpell)';
}

class Door extends MapSite{
  final Room r1;
  final Room r2;
  final bool isOpen;

  Door({required this.r1, required this.r2, this.isOpen = true}){
    if(this.r1 == this.r2){
      throw Exception('$r1 and $r2 are the same room and a normal door can not lead to the same room you walked out of.');
    }
  }

  void enter(){
    // TODO: implement method
  }
}

class DoorNeedingSpell extends Door {
  final Spell requiredSpell;
  DoorNeedingSpell({
    required super.r1,
    required super.r2,
    required this.requiredSpell
  });

  @override
  void enter(){}
}

class Wall extends MapSite{
  void enter(){
    // TODO: implement method
  }
}

class Maze {
  List _rooms = [];

  List get rooms => _rooms;

  void addRoom(Room room){
    if(!_rooms.contains(room)){
      _rooms.add(room);
    } else {
      throw Exception('$room is already a current room in the maze.');
    }
  }
}

class MazeFactory {
  Maze makeMaze()=> Maze();
  Wall makeWall()=> Wall();
  Room makeRoom({required int roomNo})=> Room(roomNo: roomNo);
  // void makeRooms({List<int> roomNums}){
  //   for(int i = 0; i < roomNums.length; i++){
  //   }
  // }
  Door makeDoor({required Room r1, required Room r2})=> Door(r1:r1, r2:r2);

}

class EnchantedMazeFactory extends MazeFactory {
  final List<Spell> roomSpells;
  final List<Spell> doorSpells;

  EnchantedMazeFactory({required this.roomSpells, required this.doorSpells});

  @override
  Room makeRoom({required int roomNo}) => EnchantedRoom(roomNo: roomNo, activeSpell: createSpell(getRandom([for(int i = 0; i < roomSpells.length; i++) roomSpells[i].name])));

  @override
  Door makeDoor({required Room r1, required Room r2}) => DoorNeedingSpell(r1:r1, r2:r2, requiredSpell: createSpell(getRandom([for(int i = 0; i < doorSpells.length; i++) doorSpells[i].name])));

  Spell createSpell(String name) => Spell(name: name);

}

class MazeGame {
  static Maze createMaze({required MazeFactory mazeFactory}){
    final maze = mazeFactory.makeMaze();
    final r1 = mazeFactory.makeRoom(roomNo: Room.currentRoomNums.length > 0 ? Room.currentRoomNums.last + 1 : 1);
    final r2 = mazeFactory.makeRoom(roomNo: Room.currentRoomNums.last + 1);
    final door = mazeFactory.makeDoor(r1: r1, r2: r2);
    final walls = [for(int i = 0; i < 6; i++) mazeFactory.makeWall()];
    r1.setSide(Direction.north, walls[0]);
    r1.setSide(Direction.east, door);
    r1.setSide(Direction.south, walls[1]);
    r1.setSide(Direction.west, walls[2]);

    r2.setSide(Direction.north, walls[3]);
    r2.setSide(Direction.east, walls[4]);
    r2.setSide(Direction.south, walls[5]);
    r2.setSide(Direction.west, door);

    maze.addRoom(r1);
    maze.addRoom(r2);

    return maze;
  }
}

T getRandom<T>(List<T> items){
  final random = Random();

  final randomIndex = random.nextInt(items.length);

  // Retrieve the item at the random index
  T randomItem = items[randomIndex];

  return randomItem;
}

void main(){
  final mazeFactory = MazeFactory();
  final enchantedMazeFactory = EnchantedMazeFactory(roomSpells: [Spell(name:'Enhanced map'), Spell(name:'Intangibility'), Spell(name:'Unlock IV')],
                                                    doorSpells: [Spell(name:'Lock I'),Spell(name:'Lock III'),Spell(name:'Lock V')]);
  final maze = MazeGame.createMaze(mazeFactory: mazeFactory);
  final enchanteMaze = MazeGame.createMaze(mazeFactory: enchantedMazeFactory);

  print(maze.rooms);
  print(enchanteMaze.rooms);

  // for(var room in maze.rooms){
  //   print(room.sides);
  // }

  // for(var room in enchanteMaze.rooms){
  //   print(room.sides);
  // }
  }

  // ABSTRACT FACTORY

  // Intent
  //  - Provide an interface for creating families of related or dependent objects without
  //    specifying their concrete classes.