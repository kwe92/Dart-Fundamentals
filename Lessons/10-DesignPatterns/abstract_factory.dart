enum Direction {north, south, east, west}

abstract class MapSite{
  void enter();
}

class Room extends MapSite{
  final int roomNo;
  static Set<int> _currentRoomNums = {};
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

class MazeGame {
  static Maze createMaze(){
    final maze = Maze();
    final r1 = Room(roomNo: 1);
    final r2 = Room(roomNo: 2);
    final door = Door(r1: r1, r2: r2);

    r1.setSide(Direction.north, Wall());
    r1.setSide(Direction.east, door);
    r1.setSide(Direction.south, Wall());
    r1.setSide(Direction.west, Wall());

    r2.setSide(Direction.north, Wall());
    r2.setSide(Direction.east, Wall());
    r2.setSide(Direction.south, Wall());
    r2.setSide(Direction.west, door);

    maze.addRoom(r1);
    maze.addRoom(r2);

    return maze;
  }
}

void main(){
  
  final maze = MazeGame.createMaze();
  print(maze.rooms);

  for(var room in maze.rooms){
    print(room.sides);
  }
  }