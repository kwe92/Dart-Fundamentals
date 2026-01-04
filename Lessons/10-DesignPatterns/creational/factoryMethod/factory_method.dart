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

class EnchantedMazeGame extends MazeGame {
  final List<Spell> roomSpells;
  final List<Spell> doorSpells;

  EnchantedMazeGame({required this.roomSpells, required this.doorSpells});

  @override
  Room makeRoom({required int roomNo}) =>
      EnchantedRoom(roomNo: roomNo, activeSpell: createSpell(getRandom([for (int i = 0; i < roomSpells.length; i++) roomSpells[i].name])));

  @override
  Door makeDoor({required Room r1, required Room r2}) => DoorNeedingSpell(
      r1: r1, r2: r2, requiredSpell: createSpell(getRandom([for (int i = 0; i < doorSpells.length; i++) doorSpells[i].name])));

  Spell createSpell(String name) => Spell(name: name);
}

class MazeGame {
  Maze makeMaze() => Maze();
  Wall makeWall() => Wall();
  Room makeRoom({required int roomNo}) => Room(roomNo: roomNo);
  Door makeDoor({required Room r1, required Room r2}) => Door(r1: r1, r2: r2);

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

// TODO: first edit pass done, do another

// Factory Method

// Intent

//  - Define an interface for creating objects (e.g., makeRoom)
//    but let subclasses (EnchantedMazeGame) decide which class to instantiate
//    allowing the instantiation logic to be deferred to the subclass

// Participants (Mapped to Sample Code)

//  - Product: Room, Door, Wall (The base classes/interfaces)

//  - ConcreteProduct: EnchantedRoom, DoorNeedingSpell (The specific implementations)

//  - Creator: MazeGame

//      - Declares the factory methods: makeRoom, makeDoor

//      - Uses the factory methods in the operation createMaze() to assemble the system (in this case a Maze)

//      - Note: In the example, the Creator is concrete and
//        provides a default implementation (returning standard Room)

//  - ConcreteCreator: EnchantedMazeGame

//     - Overrides the factory methods (makeRoom, makeDoor) to return specialized products (EnchantedRoom etc)

// Core Motivation

//  - The MazeGame class knows how to connect rooms (the layout logic in createMaze)
//    but it shouldn't be tied to what specific components are used
//    by calling makeRoom() instead of new Room()
//    the createMaze method becomes agnostic to the specific class types
//    allowing the reuse of complex connection logic for an EnchantedMazeGame without rewriting it

// Key Variations

//  - Default Implementation: Your MazeGame is a "Case 2" implementation (from the book text)
//    The Creator (v) is not abstract and provides a default set of products (Room, etc)
//    Subclasses (EnchantedMazeGame) only override methods if they need to change that specific product

//  - Hooks: The makeRoom method acts as a hook, the EnchantedMazeGame injects custom logic (adding spells)
//    inside this hook, effectively extending the object creation process (adding additional complexity)
//    without touching the client code (createMaze)

// Benefits

//  - Code Reuse: The layout logic in createMaze is written once
//    and reused for both standard and enchanted games

//  - Flexibility: You can introduce a SciFiMazeGame simply by subclassing MazeGame
//    and overriding the factory methods, without modifying
//    the existing MazeGame class (Open/Closed Principle)

// Liabilities

//  - Subclassing: To change the room type, you must create a new subclass of MazeGame
//    If you had 10 different game variations, you would need 10 different MazeGame subclasses
