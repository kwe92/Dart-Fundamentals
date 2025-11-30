import 'helper_functions.dart';
import 'maze_components.dart';
// TODO: Explain the Builder Pattern in your own words

abstract class MazeBuilder {

  Maze get currentMaze;

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

void main(){
  final mazeBuilder = StandardMazeBuilder();
  final maze = MazeGame.createMaze(mazeBuilder: mazeBuilder);

  print(maze.rooms);

  for(var room in maze.rooms){
    print(room.sides);
  }
  }
