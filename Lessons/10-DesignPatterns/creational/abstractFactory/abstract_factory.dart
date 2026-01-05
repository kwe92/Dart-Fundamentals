import '../utils/helper_functions.dart';
import '../utils/maze_components.dart';
import '../utils/enchanted_maze_components.dart';

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
  Room makeRoom({required int roomNo}) => EnchantedRoom(roomNo: roomNo, activeSpell: createSpell(randomSpell(roomSpells)));

  @override
  Door makeDoor({required Room r1, required Room r2}) =>
      DoorNeedingSpell(r1: r1, r2: r2, requiredSpell: createSpell(randomSpell(doorSpells)));

  Spell createSpell(String name) => Spell(name: name);

  String randomSpell(List<Spell> spells) => getRandom<String>([for (int i = 0; i < spells.length; i++) spells[i].name]);
}

class MazeGame {
  MazeGame();
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

// 1. Core Identity

// Pattern Name: Abstract Factory
// Category: Creational (Object)
// Also Known As: Kit
// Intent: Provide an interface for creating families of related or dependent objects
// without specifying their concrete classes.

// 2. The Problem & Solution (Motivation)

// Scenario: A Maze Game needs to support multiple themes (e.g., Standard, Enchanted, Bombed).
// Each theme has its own components (Rooms, Doors, Walls).
// Problem: Hard-coding classes (e.g., new EnchantedRoom()) makes the system difficult
// to switch themes. It also risks mixing incompatible components (e.g., a Standard Door
// inside an Enchanted Room).
// Solution: Define a MazeFactory base class. Create concrete factories (EnchantedMazeFactory)
// that create the specific products. The Client (MazeGame) uses the Factory interface
// and never sees the concrete classes.

// 3. Participants (Mapped to Dart Sample)

      // AbstractFactory (MazeFactory):

            // - Defines the interface for creating components (makeRoom, makeDoor).
            // - In the sample, it acts as a Base Class providing default implementations.

      // ConcreteFactory (EnchantedMazeFactory):

            // - Overrides operations to create specific products unique to its family.

      // AbstractProduct (Room, Door):

            // - The interface/base class known to the client.

      // ConcreteProduct (EnchantedRoom, DoorNeedingSpell):

            // - The specific implementations created by the concrete factory.

      // Client (MazeGame):

            // - Uses the factory interface to build the system, unaware of the concrete types.

// 4. Consequences

      // Isolation of Concrete Classes: The Client creates objects solely through the interface
      // (makeRoom). It effectively hides the new EnchantedRoom() calls.
      // Consistency: Enforces that objects in a family work together. The EnchantedMazeFactory
      // ensures that an EnchantedRoom is always paired with a DoorNeedingSpell.
      // Exchangeability: You can switch the entire application behavior (Standard vs. Magic)
      // by changing a single line of code: the factory instance passed to the client.
      // Interface Rigidity (Key Liability): Adding a new product type is difficult. If you
      // wanted to add a makeTrap() method, you would have to modify the MazeFactory interface
      // and every subclass, breaking the Open/Closed principle.

// 5. Implementation Techniques

      // Singleton: Concrete factories are often implemented as Singletons since an app usually
      // only needs one factory instance per session.
      // Factory Methods: The concrete factory usually implements creation via simple Factory
      // Methods (overriding makeRoom).
      // Prototypes: If there are many product families, a factory can be implemented using
      // Prototypes (cloning existing objects) to avoid creating a new Factory class for every variation.

// 6. Structural Insight: Inheritance vs. Composition

      // The pattern uses a hybrid approach to achieve flexibility:

            // Inheritance (The "Variations"):

                  // - Used within the Factory hierarchy (`EnchantedMazeFactory extends MazeFactory`).
                  // - This is how we define *how* the logic differs (Polymorphism).

            // Composition (The "Usage"):

                  // - Used between the Client and the Factory.
                  // - The Client (`MazeGame`) does not inherit from the Factory; it *composes* it (holds a reference).
                  // - This is what allows the Factory to be injected and swapped at runtime.
                  // - Contrast: This differs from the "Factory Method" pattern, where the Client often
                  //  inherits from a Creator class to access the factory logic.

// 7. Abstract Factory and Dependency Injection (Modern Context)

      // The act of passing the factory into MazeGame.createMaze is a specific implementation
      // of Dependency Injection (DI)—specifically Method Injection.

      // How the concepts overlap:

            // 1. The Mechanism is Dependency Injection:

                  // - DI solves the question: How does the function get the object it needs?
                  // - Answer: It is passed in as a parameter (injected).
                  // - Without DI, the dependency would be hard-coded (MazeFactory f = EnchantedMazeFactory()).

            // 2. The Strategy is Abstract Factory:
                  
                  // - Abstract Factory solves the question: What does this injected object actually do?
                  // - Answer: It creates families of objects (Rooms, Doors, Walls).

// Summary: In modern architecture, the Abstract Factory provides the abstraction,
// and DI provides the flexibility to swap implementations.