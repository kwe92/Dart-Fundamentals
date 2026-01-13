import 'helper_functions.dart';

typedef Side = (Direction, MapSite?);

// Interface for things that can be cloned
abstract class Cloneable<T> {
  T clone();
}

// Interface For Products like (Room, Wall, Door)
abstract class MapSite<T> implements Cloneable<T> {
  void enter();
}

class Maze implements Cloneable<Maze> {
  List<Room> _rooms = [];

  List<Room> get rooms => _rooms;

  Maze clone() => Maze();

  void addRoom(Room room) {
    final isDuplicateRoomNo = _rooms.any((r) => r.roomNo == room.roomNo);
    if (!isDuplicateRoomNo) {
      _rooms.add(room);
    } else {
      throw Exception('$room is already a current room in the maze.');
    }
  }

  int getNextRoomId() => _rooms.isEmpty ? 1 : _rooms.last.roomNo + 1;
}

class Room implements MapSite<Room> {
  late final int roomNo;

  List<Side> _sides = [(Direction.north, null), (Direction.east, null), (Direction.south, null), (Direction.west, null)];

  List<Side> get sides => _sides;

  Room();

  // initialize separates internal state from object creation
  void initialize(int roomNo) => this.roomNo = roomNo;

  @override
  String toString() {
    // defensive coding practice for debug printing late variables
    try {
      return 'Room(roomNo: $roomNo)';
    } catch (e) {
      return 'Room(Uninitialized)';
    }
  }

  void enter() {
    // TODO: implement method
  }

  Room clone() => Room().._sides = List.from(this._sides);

  void setSide(Direction direction, MapSite element) {
    final index = _sides.indexWhere((side) => side.$1 == direction);
    if (index != -1) {
      _sides[index] = (direction, element);
    }
  }

  MapSite? getSide(Direction direction) {
    final record = _sides.firstWhere((side) => side.$1 == direction, // find the first matching record
        orElse: () => (direction, null)); // orElse return default
    return record.$2;
  }
}

class Door implements MapSite<Door> {
  late final Room r1;
  late final Room r2;
  bool _isOpen = true;

  bool get isOpen => _isOpen;

  Door();

  void initialize(Room r1, Room r2, [bool? isOpen]) {
    if (r1 == r2) {
      throw Exception('A door cannot connect a room to itself.');
    }
    this.r1 = r1;
    this.r2 = r2;
    this._isOpen = isOpen != null ? isOpen : this.isOpen;
  }

  void enter() {}

  Door clone() => Door().._isOpen = this.isOpen;
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

class EnchantedRoom extends Room {
  final List<Spell> _roomSpells = [Spell(name: 'Enhanced map'), Spell(name: 'Intangibility'), Spell(name: 'Unlock IV')];
  late final Spell activeSpell;

  EnchantedRoom();

  @override
  void initialize(int roomNo) => this
    ..roomNo = roomNo
    ..activeSpell = getRandom([for (int i = 0; i < _roomSpells.length; i++) _roomSpells[i]]);

  @override
  EnchantedRoom clone() => EnchantedRoom();

  @override
  String toString() => 'Room(roomNo: $roomNo, activeSpell: $activeSpell)';
}
