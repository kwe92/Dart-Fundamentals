import '../../utils/helper_functions.dart';
import '../../utils/maze_components.dart';
import '../../utils/enchanted_maze_components.dart';

// Base Class: Creator - (Abstract Interface - API)
class MazeGame {
  Maze makeMaze() => Maze();
  Wall makeWall() => Wall();
  Room makeRoom({required int roomNo}) => Room(roomNo: roomNo);
  Door makeDoor({required Room r1, required Room r2}) => Door(r1: r1, r2: r2);

  // Template Method
  Maze createMaze() {
    final maze = makeMaze();
    final r1 = makeRoom(roomNo: Room.currentRoomNums.length > 0 ? Room.currentRoomNums.last + 1 : 1);
    final r2 = makeRoom(roomNo: Room.currentRoomNums.last + 1);
    final door = makeDoor(r1: r1, r2: r2);
    final walls = [for (int i = 0; i < 6; i++) makeWall()];
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

// Concrete Creator
class EnchantedMazeGame extends MazeGame {
  final List<Spell> roomSpells;
  final List<Spell> doorSpells;

  EnchantedMazeGame({required this.roomSpells, required this.doorSpells});

  // change room type
  @override
  Room makeRoom({required int roomNo}) =>
      EnchantedRoom(roomNo: roomNo, activeSpell: createSpell(getRandom([for (int i = 0; i < roomSpells.length; i++) roomSpells[i].name])));

  // change door type
  @override
  Door makeDoor({required Room r1, required Room r2}) => DoorNeedingSpell(
      r1: r1, r2: r2, requiredSpell: createSpell(getRandom([for (int i = 0; i < doorSpells.length; i++) doorSpells[i].name])));

  Spell createSpell(String name) => Spell(name: name);
}

void main() {
  final enchantedGame = EnchantedMazeGame(
      roomSpells: [Spell(name: 'Enhanced map'), Spell(name: 'Intangibility'), Spell(name: 'Unlock IV')],
      doorSpells: [Spell(name: 'Lock I'), Spell(name: 'Lock III'), Spell(name: 'Lock V')]);

  final game = MazeGame();
  final maze = game.createMaze();
  final enchanteMaze = enchantedGame.createMaze();

  print(maze.rooms);
  print(enchanteMaze.rooms);
}

// 1. Core Identity

      // Pattern Name: Factory Method
      // Category: Creational (Class)
      // Also Known As: Virtual Constructor
      // Intent: Define an interface for creating an object, but let subclasses decide which
      // class to instantiate. Factory Method lets a class defer instantiation to subclasses.

// 2. The Problem & Solution (Motivation)

      // Scenario: A `MazeGame` contains complex logic (`createMaze`) to assemble a maze.
      // Problem: If `createMaze` calls `new Room()` directly, the class is hard-coded.
      // To build an `EnchantedMaze`, you would have to rewrite the complex connection logic.
      // Solution: Encapsulate creation in a method (`makeRoom`). `MazeGame` calls this instead
      // of `new`.
      // Core Motivation (From Notes):
      // - This makes the `createMaze` method **agnostic** to the specific class types.
      // - It allows the reuse of complex connection logic for an `EnchantedMazeGame` without
      // rewriting it.

// 3. Participants (Mapped to Dart Sample)

      // Product (Room):

            // - The base class/interface of objects created.
            //  ConcreteProduct (EnchantedRoom):
            // - The specific implementation.

      // Creator (MazeGame):

            // - Declares factory methods (`makeRoom`, `makeDoor`).
            // - Uses them in the `createMaze()` operation to assemble the system.
            // - Note: In the sample, this is a "Concrete Creator" providing default implementations.

      // ConcreteCreator (EnchantedMazeGame):

            // - Overrides factory methods to return specialized products (`EnchantedRoom`).

// 4. Consequences

      // Flexibility (Open/Closed Principle): You can introduce a `SciFiMazeGame` simply by
      // subclassing `MazeGame` and overriding factory methods, without modifying the existing
      // `MazeGame` class.
      // Hooks for Subclasses: `EnchantedMazeGame` injects custom logic (adding spells) inside
      // the hook, extending the object creation process without touching client code.
      // Connects Parallel Hierarchies: Can connect a `MazeGame` hierarchy to a `Room` hierarchy.

      // Liability - Class Explosion:
            
            // - To change the room type, you *must* create a new subclass of `MazeGame`.
            // - If you had 10 different game variations, you would need 10 different `MazeGame` subclasses.

// 5. Implementation Issues

      // Two Major Varieties:

            // 1. Abstract Creator: Factory method is abstract. Subclasses MUST implement.
            // 2. Concrete Creator (Used in Sample): Factory method has a default implementation.
            //    Parameterized Factory Methods: A factory method could take an ID argument to create
            //    multiple kinds of products.

// 6. Structural Insight: Inheritance vs. Composition

      // Factory Method (Class Pattern):
            
            // - Relies solely on inheritance.
            // - You vary the product by creating a new *subclass* of the Creator (`EnchantedMazeGame` extends `MazeGame`).
            // - Instantiation Requirement: The Creator (`MazeGame`) MUST be instantiated. You cannot
            //   use static methods because static methods cannot be overridden/polymorphic. The
            //   "State" of the variation is tied to the specific instance type you created.

      // Abstract Factory (Object Pattern):
      
            // - Relies on Composition (and Inheritance for the factory hierarchy).
            // - You vary the product by passing a different factory *object* to the client.
            // - Stateless/Static Potential: As seen in the sample code, the Client (`MazeGame`)
            //   can be completely stateless (or use static methods) because the variation is passed
            //   in as an argument. It doesn't need to change its own identity to change behavior.

// 7. Sample Code Use Case & Analysis

      // Scenario: Maze Generation (Standard vs. Enchanted).

      // The Hook Method (Factory Method):

          // - `MazeGame` defines `makeRoom()` which returns a standard `Room`.
          // - `EnchantedMazeGame` overrides `makeRoom()` to return an `EnchantedRoom` with spells.

      // The Template Method (The "Why" it works):
      
            // - The `createMaze()` method in `MazeGame` contains the logic:

                  // "Make a room, then make another room, then connect them."

                  // - Crucially, `createMaze()` calls `makeRoom()` (the factory method).
                  // - When `EnchantedMazeGame` runs `createMaze()`, it executes the logic defined in the
                  //   parent class, but polymorphism ensures the *subclass* version of `makeRoom` runs.

      // Result:
      
      // - The "Construction Algorithm" was reused, but the "Building Blocks" were changed via inheritance.
