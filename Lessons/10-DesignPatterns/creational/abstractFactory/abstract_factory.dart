import '../utils/helper_functions.dart';
import '../utils/maze_components.dart';

class Spell {
  final name;
  Spell({required this.name});

  @override
  String toString() => 'Spell(name: $name)';
}

class EnchantedRoom extends Room {
  final Spell activeSpell;
  EnchantedRoom({required super.roomNo, required this.activeSpell});

  @override
  String toString() => 'Room(roomNo: $roomNo, activeSpell: $activeSpell)';
}

class DoorNeedingSpell extends Door {
  final Spell requiredSpell;
  DoorNeedingSpell({required super.r1, required super.r2, required this.requiredSpell});

  @override
  void enter() {}
}

class MazeFactory {
  Maze makeMaze() => Maze();
  Wall makeWall() => Wall();
  Room makeRoom({required int roomNo}) => Room(roomNo: roomNo);
  Door makeDoor({required Room r1, required Room r2}) => Door(r1: r1, r2: r2);
}

class EnchantedMazeFactory extends MazeFactory {
  final List<Spell> roomSpells;
  final List<Spell> doorSpells;

  EnchantedMazeFactory({required this.roomSpells, required this.doorSpells});

  @override
  Room makeRoom({required int roomNo}) =>
      EnchantedRoom(roomNo: roomNo, activeSpell: createSpell(getRandom([for (int i = 0; i < roomSpells.length; i++) roomSpells[i].name])));

  @override
  Door makeDoor({required Room r1, required Room r2}) => DoorNeedingSpell(
      r1: r1, r2: r2, requiredSpell: createSpell(getRandom([for (int i = 0; i < doorSpells.length; i++) doorSpells[i].name])));

  Spell createSpell(String name) => Spell(name: name);
}

class MazeGame {
  static Maze createMaze({required MazeFactory mazeFactory}) {
    final maze = mazeFactory.makeMaze();
    final r1 = mazeFactory.makeRoom(roomNo: Room.currentRoomNums.length > 0 ? Room.currentRoomNums.last + 1 : 1);
    final r2 = mazeFactory.makeRoom(roomNo: Room.currentRoomNums.last + 1);
    final door = mazeFactory.makeDoor(r1: r1, r2: r2);
    final walls = [for (int i = 0; i < 6; i++) mazeFactory.makeWall()];
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

void main() {
  final mazeFactory = MazeFactory();
  final enchantedMazeFactory = EnchantedMazeFactory(
      roomSpells: [Spell(name: 'Enhanced map'), Spell(name: 'Intangibility'), Spell(name: 'Unlock IV')],
      doorSpells: [Spell(name: 'Lock I'), Spell(name: 'Lock III'), Spell(name: 'Lock V')]);
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

  // TODO: first edit pass done, do another

// ABSTRACT FACTORY

// Intent

//  - Provide an interface for creating families of related or dependent objects
//    (e.g. Rooms and Doors together)
//    without specifying their concrete classes (e.g. EnchantedRoom)

//  - Provide the ability to add or swap different representations of Objects easily (Polymprhism)

// Participants (Mapped to Sample Code)

//  - Abstract/Base Factory: The MazeFactory Class

//     - Abstract Factory as an Abstract Class with Pure Abstraction: can not be instantiated and
//       defines the interface for creating components

//     - Abstract Factory as a Base Class: provides default implementations (what our example MazeFactory class does, e.g. Maze makeMaze() => Maze();)

//  - Concrete Factory: EnchantedMazeFactory (Implements the or overrides operations to create specific products that are unique to its family)

//  - Abstract Product: Room, Door, etc (The interface/base class known to the client)

//  - Concrete Product: EnchantedRoom, DoorNeedingSpell (The specific implementations created by the concrete factory of the corresponding family)

//  - Client: MazeGame (Uses the factory interface or base class to build the system, unaware of the concrete types)

// Key Benefits

//  - Product Consistency: It enforces that objects in a family work together
//    the EnchantedMazeFactory ensures that an EnchantedRoom is always paired with a DoorNeedingSpell

// Isolation: The Client (MazeGame) creates objects solely through the interface (makeRoom)
// effectively hiding the new EnchantedRoom() calls, isolating the client from implementation changes

// Exchangeability: You can switch the entire application behavior (Standard vs. Magic)
// by changing a single line of code the factory instance passed to the client ( MazeGame.createMaze(mazeFactory: mazeFactoryInstance); )

// Key Liability

// Interface Rigidity:

//  - Supporting new kinds of products is difficult (adding additional behavior)
//    If you wanted to add a makeTrap() method, you would have to modify
//    the MazeFactory interface and every subclass (both MazeFactory and EnchantedMazeFactory)
//    breaking the Open/Closed principle

// Implementation Notes

//  - Singleton: Concrete factories are often implemented as Singletons since an app usually only needs one factory instance per session

//  - Factory Methods: The concrete factory usually implements creation via simple Factory Methods (overriding makeRoom)

//  - Prototype Alternative: If there are many product families, a factory can be implemented using Prototypes (cloning existing objects) to avoid creating a new Factory class for every variation

// Abstract Factory and Dependency Injection

//  - The act of passing the factory into MazeGame.createMaze is a
//    specific implementation of Dependency Injection (DI) specifically Method Injection ( MazeGame.createMaze(mazeFactory: mazeFactoryInstance); )

// How the two concepts overlap in the sample code:

// 1. The Mechanism is Dependency Injection

//  - Dependency Injection is the technique used to deliver the dependency

//  - The Dependency: The MazeFactory (or EnchantedMazeFactory)

//  - The Client: The MazeGame

// The Injection: You are "injecting" the factory via the method argument:

    // The parameter `mazeFactory` is the injection point
    // static Maze createMaze({required MazeFactory mazeFactory}) { ... }
    // If you didn't use DI, the code would look like this (hard-coded dependency):
    // code
    // Dart
    // static Maze createMaze() {
    //    MazeFactory factory = EnchantedMazeFactory(); // Hard-coded!
      // ...
    // }

// 2. The Strategy is Abstract Factory

//  - Abstract Factory is the design pattern that defines what the dependency does

//  - The pattern dictates that the object you inject (MazeFactory)
//    must be an interface responsible for creating families of objects

// Summary

//  - Dependency Injection is used to deliver an Abstract Factory

//  - DI solves the question: "How does the function get the object it needs?"

//     - (Answer: It is passed in as a parameter)

//  - Abstract Factory solves the question: "What does this object actually do?"

//     - (Answer: It creates Rooms, Doors, and Walls).

//  - In modern software architecture, these two go hand-in-hand
//    the Abstract Factory provides the abstraction, and DI provides the flexibility to swap implementations.