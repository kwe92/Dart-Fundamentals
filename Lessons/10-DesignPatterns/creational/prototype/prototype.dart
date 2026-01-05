import '../utils/helper_functions.dart';
import '../utils/prototype_maze_components.dart';

// Creator Class
class MazeFactory {
  final Maze _prototypeMaze;
  final Room _prototypeRoom;
  final Wall _prototypeWall;
  final Door _prototypeDoor;

  MazeFactory({Maze? maze, Room? room, Door? door, Wall? wall})
      : _prototypeMaze = maze ?? Maze(),
        _prototypeRoom = room ?? Room(),
        _prototypeWall = wall ?? Wall(),
        _prototypeDoor = door ?? Door();

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
  final mazeFactory = MazeFactory(room: EnchantedRoom());
  final maze = MazeGame.createMaze(mazeFactory: mazeFactory);

  print("Maze created with ${maze.rooms.length} rooms.");

  for (var room in maze.rooms) {
    print(room);
    print(room.sides);
  }
}

// 1. Core Identity

      // Pattern Name: Prototype
      // Category: Creational (Object)
      // Intent: Specify the kinds of objects to create using a prototypical instance, and
      // create new objects by copying (cloning) this prototype.
      // Core Concept: Treat object creation as a "copy" operation rather than a "new" operation.

// 2. The Problem & Solution (Motivation)

      // Scenario: A MazeFactory needs to create different kinds of objects (Standard Room vs.
      // Enchanted Room).
      // Problem: In Abstract Factory, changing products requires creating a new Factory subclass
      // (e.g., `EnchantedMazeFactory` class). This leads to a parallel class hierarchy.
      // Solution: Parameterize a single `MazeFactory` class with *instances* (Prototypes).
      // The Factory remains a single concrete class; we simply configure it with different
      // objects at runtime.

// 3. Participants (Mapped to Dart Sample)

      // Prototype Interface (Cloneable<T> / MapSite<T>):

      // - Declares the interface for cloning.
      // - Applies Interface Segregation Principle (ISP): Separation of Copying capability.

      // Concrete Prototype (Room, EnchantedRoom, Door):

      // - Implements the clone() operation.
      // - Acts as a Template: These objects are never inserted into the game; they exist
      //   solely to spawn copies.

      // Client / Manager (MazeFactory):

      // - As Client: Creates new objects by asking the prototype to clone itself.
      // - As Manager: Acts as a registry/store for the prototypes.

      // Product:

      // - The distinct instances resulting from the manufacturing process (Clone + Initialize).

// 4. Consequences

      // Reduced Subclassing: You don't need a hierarchy of Creator classes. One `MazeFactory`
      // class handles ALL game variations.
      // Dynamic Configuration: You can add/swap prototypes at run-time (e.g., loading a
      // plugin) without recompiling the Factory logic.
      // Liability - Cloning Complexity: Implementing clone() is difficult (Deep vs. Shallow copy).
      // Liability - Initialization States: Object exists briefly in an uninitialized state.

// 5. Implementation Issues (Dart Specifics)

      // The Uniform Interface Problem:

            // - clone() cannot accept arguments.
            // - Solution: Separate Creation (clone) from Configuration (initialize).

      // Deep Copy Logic:

            // - Essential for aggregate objects (`List.from(this._sides)`).

      // Dart Syntax Nuances:

            // - late final: Allows clean instantiation of the prototype.
            // - Cascade Operator (..): Fluently chains creation and configuration.

// 6. Structural Insight: The Two-Level Injection Architecture

      // This pattern utilizes two distinct levels of Dependency Injection to achieve
      // total flexibility without subclassing:

            // Level 1: Method Injection (Into the Game)

                  // - `MazeGame.createMaze({required MazeFactory factory})`
                  // - The Game accepts *any* factory. This is similar to Abstract Factory.

            // Level 2: Constructor Injection (Into the Factory)

                  // - `MazeFactory({required Room prototypeRoom, ...})`
                  // - This is the Critical Difference.
                  // - In Abstract Factory, the products are hard-coded into the Factory Subclass.
                  // - In Prototype, the products are injected into the Factory Instance.

      // Result: Total Decoupling

            // - To change from "Standard" to "Enchanted":
            // - Abstract Factory: You must write a new class `EnchantedMazeFactory`.
            // - Prototype: You simply pass different arguments to the `MazeFactory` constructor.
            // - The `MazeFactory` class is never subclassed; it is reused 100%.

// 7. Sample Code Use Case & Analysis

      // Scenario: Maze Construction via Cloning.

            // The Generic Factory (The "Magic"):

                  // - The `MazeFactory` is concrete, not abstract.
                  // - In `main()`, we pass `room: EnchantedRoom()`.

            // The Cloning Process:

                  // - When `MazeGame` calls `mazeFactory.makeRoom()`, the factory runs `_prototypeRoom.clone()`.
                  // - Since `_prototypeRoom` is an `EnchantedRoom`, the clone method returns a new
                  // `EnchantedRoom` with a random spell.

            // Defensive Coding:

                  // - `Room.toString()` uses try/catch to handle printing of uninitialized prototypes.
