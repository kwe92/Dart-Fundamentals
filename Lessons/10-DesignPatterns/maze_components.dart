import 'helper_functions.dart';

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
