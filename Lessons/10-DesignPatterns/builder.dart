import 'dart:math';

// TODO: Explain the Builder Pattern in your own words

enum Direction {north, south, east, west}

abstract class MapSite{
  void enter();
}

class Room extends MapSite{
  static Set<int> _currentRoomNums = {};
  final int roomNo;
  List _sides = List.filled(4, 0);

  static get currentRoomNums => _currentRoomNums;
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
    final emptyIndex = _sides.indexWhere((side)=> side == 0);
    _sides[emptyIndex] = (direction, element);
  }

  void replaceSide(Direction direction) {
    final index = _sides.indexWhere((mapSiteRecord) => mapSiteRecord.$1 == direction);
    if (index != -1) {
      print('replacing MapSite of: $direction');
      _sides[index] = (direction, _sides[index].$2);
      }
  }

  MapSite? getSide(){
    // TODO: implement method
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

abstract class MazeBuilder {

  Maze get currentMaze;

  MazeBuilder();
  
  void buildMaze(){}

 void buildRoom(){}

 void buildDoor(int roomFrom, int roomTo){}
}

class StandardMazeBuilder extends MazeBuilder{
  late final Maze _maze;

  @override
  get currentMaze => _maze!;

  @override
  void buildMaze() => _maze = Maze();

  @override
  void buildRoom(){
      final room = Room(roomNo: Room.currentRoomNums.length > 0 ? Room.currentRoomNums.last + 1 : 1);
      final walls = [for(int i = 0; i < 4; i++) Wall()];
      room.setSide(Direction.north, walls[0]);
      room.setSide(Direction.east, walls[1]);
      room.setSide(Direction.south, walls[2]);
      room.setSide(Direction.west, walls[3]);
      _maze!.addRoom(room);
  }

  // TODO: could be refactored as on now if another random room is added the doors leading to an existing can be overriden which may not always be inteded
  @override
  void buildDoor(int roomFrom, int roomTo){
    final fromRoomIndex = _maze.rooms.indexWhere((room)=>room.roomNo == roomFrom);
    final toRoomIndex = _maze.rooms.indexWhere((room)=>room.roomNo == roomTo);
    final fromRoom = _maze.rooms[fromRoomIndex];
    final toRoom = _maze.rooms[toRoomIndex];
    final randomDirection = getRandom([Direction.north, Direction.east, Direction.south, Direction.west]);
    final oppositeDirection = getOppositeDirection(randomDirection);
    final fromSideIndex = fromRoom.sides.indexWhere((side)=>side.$1 == randomDirection);
    final toSideIndex = toRoom.sides.indexWhere((side)=>side.$1 == oppositeDirection);
    final door =  Door(r1:fromRoom, r2:toRoom);
    fromRoom.sides[fromSideIndex] = (randomDirection, door);
    toRoom.sides[toSideIndex] = (oppositeDirection, door);
  }
}

class MazeGame {
  static Maze createMaze({required MazeBuilder mazeBuilder}){
    mazeBuilder.buildMaze();
    mazeBuilder.buildRoom();
    mazeBuilder.buildRoom();
    mazeBuilder.buildDoor(mazeBuilder.currentMaze.rooms[0].roomNo,mazeBuilder.currentMaze.rooms[1].roomNo);

    return mazeBuilder.currentMaze;
  }
}

T getRandom<T>(List<T> items){
  final random = Random();

  final randomIndex = random.nextInt(items.length);

  T randomItem = items[randomIndex];

  return randomItem;
}

Direction getOppositeDirection(Direction direction) => switch (direction) {
      Direction.north => Direction.south,
      Direction.south => Direction.north,
      Direction.east => Direction.west,
      Direction.west => Direction.east,
    };

int getNegativeIndex(List list, index){
  if(list.length >= index){
    return list[(list.length - index).toInt()];
  }
  return -1;
}

void main(){
  final mazeBuilder = StandardMazeBuilder();
  final maze = MazeGame.createMaze(mazeBuilder: mazeBuilder);

  print(maze.rooms);

  for(var room in maze.rooms){
    print(room.sides);
  }
  }
