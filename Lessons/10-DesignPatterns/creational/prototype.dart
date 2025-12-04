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

class MazeFactory {
  final Maze _prototypeMaze;
  final Room _prototypeRoom;
  final Wall _prototypeWall;
  final Door _prototypeDoor;

  MazeFactory({required Maze maze, required Room room, required Door door, required Wall wall})
      : _prototypeMaze = maze,
        _prototypeRoom = room,
        _prototypeWall = wall,
        _prototypeDoor = door;

  Maze makeMaze() => _prototypeMaze.clone();

  Wall makeWall() => _prototypeWall.clone();

  Room makeRoom(int roomNo) => _prototypeRoom.clone()..initialize(roomNo);

  Door makeDoor(Room r1, Room r2) =>
      _prototypeDoor.clone()..initialize(r1, r2); // using the Cascade(..) operator to remove the need for temporary variables
}

class MazeGame {
  static Maze createMaze({required MazeFactory mazeFactory}) {
    final maze = mazeFactory.makeMaze();

    final r1 = mazeFactory.makeRoom(maze.getNextRoomId());
    maze.addRoom(r1);

    final r2 = mazeFactory.makeRoom(maze.getNextRoomId());
    maze.addRoom(r2);

    final walls = [for (int i = 0; i < 6; i++) mazeFactory.makeWall()];

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

void main() {
  final mazeFactory = MazeFactory(maze: Maze(), room: EnchantedRoom(), door: Door(), wall: Wall());
  final maze = MazeGame.createMaze(mazeFactory: mazeFactory);

  print("Maze created with ${maze.rooms.length} rooms.");

  for (var room in maze.rooms) {
    print(room);
    print(room.sides);
  }
}

// Some SOLID principles covered in the sample code

  // Interface Segregation Principle (ISP) -  Segregating Interfaces

  //   - no class should implement methods it does not use
  //     as it is better to have many small interfaces rather
  //     than one general purpose interface

  // - applied Interface Segregation by separating Cloneable (copying capability) from MapSite (game behavior)
  //   Maze implements Cloneable but not MapSite, as it is a container, not a location

  // Separation of Concerns (Single Responsibility)

  //  - Decoupling:
  
  //    - Creation (clone): the clone method is responsible for structual copying of shared state
  
  //    - Configuration (initialize): initialization is responsible for injecting unique state
  
  //    - Representation (_prototypeProduct / class Product): the code that defines WHAT the object contains and HOW it holds data
  
  //       - NOTE: class Product is generic and means any object instance returned to the Client
  //               through means that are typically hidden from the Client (Factory Methods, Builders, Prototypes, etc)

// PROTOTYPE

// Intent

//  - Specify the kinds of objects to create using a prototypical instance
//    and create new objects by copying (cloning) this prototype
//    the Prototype pattern defers the instantiation logic to the object itself
//    rather than relying on the factory class to know the specific class name
//    (e.g. Room _prototypeRoom could be a Room or an EnchantedRoom the factory has no idea as long as the contract (Interface / Base Class) it expects is adhered to)

// Participants (Mapped to Sample Code)

//  - Prototype Interface: Cloneable<T> and MapSite<T>

//      - Declares the interface for cloning (clone())

//  - Concrete Prototype: Room, Door, Wall, Maze

//     - Implements the clone() operation to return a copy of itself

//     - These instances act as templates, the objects passed to the factory constructor
//       are never inserted into the game; they exist solely to spawn copies

//  - Client / Prototype Manager: MazeFactory

//     - As Client: It creates new objects by asking the prototype to clone itself: _prototypeRoom.clone()

//     - As Manager: It acts as a registry (store) for the prototypes (_prototypeRoom, etc.)
//       in complex systems, this registry allows dynamic registration of new prototypes at runtime

//  - Product: The objects returned by makeRoom, makeDoor, etc

//     - These are the distinct instances resulting from the manufacturing process
//       (the clone plus the initialization)

// Core Motivation

//  - In previous patterns, changing the type of room (e.g., to EnchantedRoom)
//    required creating a new Factory subclass (EnchantedMazeFactory) that hard-codes the class name

//  - With the Prototype pattern, the MazeFactory class remains unchanged
//    we simply configure it with different prototypes (templates) at runtime via Composition

//  - Standard Game: MazeFactory(room: Room()...)

//  - Magic Game: MazeFactory(room: EnchantedRoom()...)

//  - This shifts the configuration from Class Inheritance (defining new factory classes)
//    to Object Composition (passing different objects to the same factory)

// Key Implementation Nuances (Dart Specific)

//  - The Uniform Interface Problem (Creation vs. Configuration):

//     - A major challenge in the Prototype pattern is that clone() cannot accept arguments
//       because different products need different data
//       this is solved by separating Creation (clone) from Configuration (initialize)

//     - Creation (clone): Creates the shell and copies structure / shared state (e.g., _sides)

//     - Configuration (initialize): Injects unique state (e.g., roomNo)

//  - late final:

//     - Allows the Prototype to be instantiated cleanly (Room()) without dummy constructor arguments
//       while still ensuring the final product's ID is immutable once initialized

//  - The Cascade Operator (..):

//     - Used in makeRoom (_prototypeRoom.clone()..initialize(roomNo))
//       which fluently chains the Creation and Configuration steps into a single returnable expression

//  - Defensive Coding:

//     - Room.toString() uses try/catch to handle cases where a prototype
//      (which has an uninitialized late final ID) might be printed during debugging

// Benefits

//  - Reduced Subclassing

//     - You do not need a parallel hierarchy of Factory classes (Standard Maze Products; parallel hierarchy: MazeFactory Class, Enchanted Maze Products; parallel hierarchy: EnchantedMazeFactory Class, etc)
//       one Factory Class handles all game variations

//  - Runtime Flexibility:

//     - You can add or swap prototypes dynamically (at run-time by creating a Maze type depending on user input)
//       without recompiling the Factory logic

//  - Decoupling (Program to an interface, not an implementation): 

//     - The Client (MazeFactory) knows nothing about the concrete classes (EnchantedRoom, DoorNeedingSpell, etc)
//       it only knows that the objects implement Cloneable or a BaseClass (Room, Door, Wall)

//  - Reduced Product Classes: 

//    - You can reduce the number of classes in your system by registering
//      different instances of the same class (configured differently) as separate prototypes

// Liabilities

//  - Cloning Complexity (Deep vs. Shallow):

//     - Implementing clone() correctly is the hardest part of the pattern
//       which requires deciding between Shallow Copies (sharing references)
//       and Deep Copies (duplicating everything)

//  - Sample Code Solution to Cloning Complexity:

//     - Implements a Structure-Deep Copy for Room by using List.from(this._sides)
//       ensuring that if you add a wall to a specific room instance
//       it does not accidentally add that wall to the prototype or other rooms

//  - Initialization States:

//     - Because the creation is split into two steps (clone and initialize)
//       there is a brief window where the object exists in an invalid or uninitialized state
//       (Handled in your code via late checks)

//    - The Factory or Builder must initialize objects
//      before handing them off to a client

// Summary

//  - The Prototype pattern is about creating objects by copying existing ones

//  - Allowing a system to be independent of how its products are created, composed, and represented
//    by treating object creation as a "copy" operation rather than a "new" operation

//  - It leverages object composition and dependency injection to configure systems at runtime
//    decoupling the client from concrete types and facilitating easier testing through mockable prototypes