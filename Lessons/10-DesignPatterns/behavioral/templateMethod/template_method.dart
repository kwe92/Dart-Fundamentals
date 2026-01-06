import '../../utils/helper_functions.dart';
import '../../utils/maze_components.dart';
import '../../utils/enchanted_maze_components.dart';

// Base Creator
class MazeGame {
  // primitive factory methods
  Maze makeMaze() => Maze();
  Wall makeWall() => Wall();
  Room makeRoom({required int roomNo}) => Room(roomNo: roomNo);
  Door makeDoor({required Room r1, required Room r2}) => Door(r1: r1, r2: r2);

  // The "Template Method" (the algorithm of abstract operations, some or all of the operations may have default implementations)
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

      // Pattern Name: Template Method
      // Category: Behavioral (Class)
      // Intent: Define the skeleton of an algorithm in an operation, deferring some steps to
      // subclasses. Template Method lets subclasses redefine certain steps of an algorithm
      // without changing the algorithm's structure.

// 2. The Problem & Solution (Motivation)

      // Scenario: A `MazeGame` needs to generate a playable level. The construction process is
      // complex and sequential: Create the Maze container -> Create Room 1 -> Create Room 2 ->
      // Create a Door between them -> Connect all walls.
      // Problem: We want to create variations of the game (e.g., `EnchantedMazeGame`). It would
      // be inefficient and risky to copy-paste the entire connection logic (the algorithm) into
      // every new subclass just to change the type of Room being used.
      // Solution: Define the invariant structure of the algorithm in a parent method `createMaze()`
      // (The Template). This method calls **Factory Methods** like `makeRoom()` to create the
      // objects. Subclasses override these Factory Methods to supply different products, while
      // the parent class preserves the order of operations.

// 3. Participants (Mapped to Dart Sample)

      // AbstractClass (MazeGame):

      // - Implements the template method (`createMaze`) defining the skeleton of the algorithm.
      // - Defines Factory Methods (`makeRoom`, `makeWall`) as primitive operations that
      //   subclasses can override.
      // - Note: In this sample, `MazeGame` is concrete and provides default implementations.
      //   ConcreteClass (EnchantedMazeGame):
      // - Implements/Overrides the Factory Methods (`makeRoom`) to carry out subclass-specific
      //   steps (e.g., adding Spells to the room).

// 4. Consequences

      // Hollywood Principle: "Don't call us, we'll call you.":

            // - The Parent class (`MazeGame`) calls the operations of the Subclass (`EnchantedMazeGame`),
            //   inverting the typical control flow.

      // Code Reuse: Factors out the common "wiring" logic (connecting North/South/East/West)
      // into a single place.
      
      // Control of Extensions: The parent controls exactly *when* the subclass logic is executed
      // (e.g., `makeRoom` is guaranteed to be called before `addRoom`).

// 5. Implementation Issues

      // Types of Operations called by Template Method:

            // - Factory Methods: (CRITICAL IN THIS EXAMPLE) Methods like `makeRoom` that create
            //   the objects used by the algorithm.
            
      // - Primitive Operations: Abstract methods that must be overridden.
      
      // - Hook Operations: Methods with default behavior that may be overridden.
      
      // Minimizing Primitives: Keep the number of methods a subclass *must* override to a
      // minimum to make the pattern easier to use.

// 6. Comparison with Related Patterns

      // Factory Method: Factory methods are often called within Template Methods.

      // - In the sample: `createMaze()` is the Template Method, and `makeRoom()` is the Factory Method.

      // Strategy:

            // - Template Method uses Inheritance to vary *part* of an algorithm.
            // - Strategy uses Delegation (Composition) to vary the *entire* algorithm.

// 7. Sample Code Use Case & Analysis

      // Scenario: Maze Generation Algorithm.

      // The Template (The Skeleton):

            // - `MazeGame.createMaze()` defines the exact sequence: "Make maze, make 2 rooms,
            //   make door, connect walls."
            
            // - This sequence is INVARIANT (it never changes, regardless of the game type).

      // The Deferred Steps (The Factory Methods):

            // - `makeRoom()` and `makeDoor()` are the variable steps.
            // - They serve a dual purpose: They are "Hooks" for the Template Method, and "Factory
            //   Methods" for object creation.
            // - `EnchantedMazeGame` overrides them to inject magic logic.

      // Execution Flow:

            // - When we run `enchantedGame.createMaze()`, the code executing is actually inside the
            //   Parent Class (`MazeGame`).

            // - However, when that code hits `makeRoom()`, Polymorphism routes the call back down
            //   to `EnchantedMazeGame`.

            // - This allows us to reuse the complex wiring logic of `createMaze` while swapping
            //   out the building blocks via the Factory Methods.
