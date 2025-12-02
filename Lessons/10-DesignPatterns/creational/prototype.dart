import 'helper_functions.dart';

// TODO: may need to refactor seems unnecessarily difficult

abstract class MapSite<T>{
  void enter();
  T clone();
}

class Room implements MapSite<Room>{
  static Set<int> _currentRoomNums = {};
  final int roomNo;
  List _sides = List.filled(4, 0);

  static get currentRoomNums => _currentRoomNums;
  List get sides => _sides;

  Room({required this.roomNo}){
     _currentRoomNums.add(this.roomNo);
  }

  @override
  String toString() => 'Room(roomNo: $roomNo)';

  void enter(){
    // TODO: implement method
  }

  void setSide(Direction direction, MapSite element){
    final emptyIndex = _sides.indexWhere((side)=> side == 0);
    _sides[emptyIndex] = (direction, element);
  }

  MapSite? getSide(){
    // TODO: implement method
  }

  Room clone({int? roomNo, List? sides}){
    if(sides != null){
      final room = Room(roomNo: roomNo != null ? roomNo : this.roomNo);
      for(var side in sides){
        room.setSide(side.$1, side.$2);
      }
      return room;
    }
    final room = Room(roomNo: roomNo != null ? roomNo : this.roomNo);
    for(var side in this.sides){
      if(side != 0){
        room.setSide(side.$1, side.$2);
      }
        
      }
    return room;
  }
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

  Door clone({Room? r1, Room? r2, bool? isOpen}) => Door(r1: r1 != null ? r1 : this.r1,
                                                       r2: r2 != null ? r2 : this.r2,
                                                       isOpen: isOpen != null ? isOpen : this.isOpen);
}

class Wall extends MapSite{
  void enter(){
    // TODO: implement method
  }

  Wall clone()=> Wall();
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

  Maze clone({List<Room>? rooms}){
    if(rooms != null){
      final maze = Maze();
      for(var room in rooms){
        addRoom(room);
      }
      return maze;
    }
    final maze = Maze();
    for(var room in this.rooms){
      addRoom(room);
      }
    return maze;
    }
}

class MazeFactory {
  final Maze _prototypeMaze;
  final Room _prototypeRoom;
  final Wall _prototypeWall;
  final Door _prototypeDoor;
  
  MazeFactory(Maze maze, Room room, Wall wall, Door door)
      : _prototypeMaze = maze,
        _prototypeRoom = room,
        _prototypeWall = wall,
        _prototypeDoor = door;

  Maze makeMaze()=> _prototypeMaze.clone();
  Wall makeWall()=> _prototypeWall.clone();
  Room makeRoom({required int roomNo})=> _prototypeRoom.clone(roomNo: roomNo);
  Door makeDoor({required Room r1, required Room r2})=> _prototypeDoor.clone(r1:r1,r2:r2);
}


class MazeGame {
  static Maze createMaze({required MazeFactory mazeFactory}){
    int roomNo = 1;
    final maze = mazeFactory.makeMaze();
    final r1 = mazeFactory.makeRoom(roomNo: roomNo);
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

void main(){
  final mazeFactory = MazeFactory(Maze(), Room(roomNo:-1), Wall(), Door(r1:Room(roomNo:-2), r2: Room(roomNo:-3)));
  // final enchantedMazeFactory = EnchantedMazeFactory(roomSpells: [Spell(name:'Enhanced map'), Spell(name:'Intangibility'), Spell(name:'Unlock IV')],
  //                                                   doorSpells: [Spell(name:'Lock I'),Spell(name:'Lock III'),Spell(name:'Lock V')]);
  final maze = MazeGame.createMaze(mazeFactory: mazeFactory);
  // final enchanteMaze = MazeGame.createMaze(mazeFactory: enchantedMazeFactory);

  print(maze.rooms);
  // print(enchanteMaze.rooms);

  for(var room in maze.rooms){
    print(room.sides);
  }

  // for(var room in enchanteMaze.rooms){
  //   print(room.sides);
  // }
  }
