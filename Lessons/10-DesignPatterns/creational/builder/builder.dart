import '../utils/helper_functions.dart';
import '../utils/maze_components.dart';

abstract class MazeBuilder {
  Maze get currentMaze;

  void buildMaze();

  void buildRoom();

  void buildDoor(int roomFrom, int roomTo);
}

// REPRESENTATION

//  - Where is it? Inside StandardMazeBuilder
//  - What is it? It is the specific classes (Room, Wall, Door) and
//    how they are stored in memory (List, variables)

class StandardMazeBuilder extends MazeBuilder {
  late final Maze _maze;

  @override
  get currentMaze => _maze;

  @override
  void buildMaze() => _maze = Maze();

  @override
  void buildRoom() {
    final room = Room(roomNo: Room.currentRoomNums.length > 0 ? Room.currentRoomNums.last + 1 : 1);
    final walls = [for (int i = 0; i < 4; i++) Wall()];
    room.setSide(Direction.north, walls[0]);
    room.setSide(Direction.east, walls[1]);
    room.setSide(Direction.south, walls[2]);
    room.setSide(Direction.west, walls[3]);
    _maze.addRoom(room);
  }

  // TODO: could be refactored as of now if another random room is added the doors leading to an existing can be overriden which may not always be inteded
  @override
  void buildDoor(int roomFrom, int roomTo) {
    final fromRoomIndex = _maze.rooms.indexWhere((room) => room.roomNo == roomFrom);
    final toRoomIndex = _maze.rooms.indexWhere((room) => room.roomNo == roomTo);
    final fromRoom = _maze.rooms[fromRoomIndex];
    final toRoom = _maze.rooms[toRoomIndex];
    final randomDirection = getRandom([Direction.north, Direction.east, Direction.south, Direction.west]);
    final oppositeDirection = getOppositeDirection(randomDirection);
    final fromSideIndex = fromRoom.sides.indexWhere((side) => side.$1 == randomDirection);
    final toSideIndex = toRoom.sides.indexWhere((side) => side.$1 == oppositeDirection);
    final door = Door(r1: fromRoom, r2: toRoom);
    fromRoom.sides[fromSideIndex] = (randomDirection, door);
    toRoom.sides[toSideIndex] = (oppositeDirection, door);
  }
}

// Director
//  - Knows the order of operations
//  - Does not know what the maze is actually made of (Room, EnchantedRoom, BombedRoom, etc)
class MazeGame {
  // CONSTRUCTION
  //  - the that code dictates the logic/sequence (the operations must happen in a specific order)
  //  - Where is it? Inside MazeGame.createMaze
  //  -  What is it? The sequence of method calls
  static Maze createMaze({required MazeBuilder mazeBuilder}) {
    // Directions
    mazeBuilder.buildMaze(); // Step 1: Start
    mazeBuilder.buildRoom(); // Step 2: Add a room
    mazeBuilder.buildRoom(); // Step 3: Add another room
    mazeBuilder.buildDoor(
        mazeBuilder.currentMaze.rooms[0].roomNo, mazeBuilder.currentMaze.rooms[1].roomNo); // Step 4: Connect them with a door

    return mazeBuilder.currentMaze;
  }
}
// Construction vs Representation

//  - If you pass EnchantedMazeBuilder to the MazeGame
//    the Construction (the steps in MazeGame) stays exactly the same
//    but the Representation changes completely

void main() {
  final mazeBuilder = StandardMazeBuilder();
  final maze = MazeGame.createMaze(mazeBuilder: mazeBuilder);

  print(maze.rooms);

  for (var room in maze.rooms) {
    print(room.sides);
  }
}

// Builder

// Intent

// - Separate the construction of a complex object (Maze) from its representation
//   allowing the same construction process (the sequence of steps in MazeGame)
//   to create different representations (e.g. StandardMazeBuilder vs. EnchantedMazeBuilder)

// Participants (Mapped to Sample Code)

//  - Builder: MazeBuilder
//     - Specifies the abstract interface (buildMaze, buildRoom, buildDoor)
//       for creating parts of the Product (Maze)

//  - ConcreteBuilder: StandardMazeBuilder

//     - Constructs and assembles parts of the product
//       (e.g. creates Room, initializes 4 Walls, resolves side connections)

//     - Keeps track of the representation being built (_maze)

//     - Exposes the result via currentMaze 

//  - Director: MazeGame (specifically the createMaze method)

//     - Constructs the object using the Builder interface

      // It defines the algorithm or sequence of construction: "Start Maze" 
      // →
      // →
      //  "Room" 
      // →
      // →
      //  "Room" 
      // →
      // →
      //  "Door"

// - Product: Maze

//    - The complex object under construction

// Core Motivation

//  - The MazeGame needs a maze with two rooms and a connecting door
//    However, the logic to ensure a room has 4 walls
//    or the math required to orient a door correctly (finding indexes, calculating oppositeDirection)
//    is complex assembly logic, by using a Builder, MazeGame simply issues high-level commands
//    ("build a door between 1 and 2"), and the StandardMazeBuilder handles the messy details of internal assembly

// Key Variations

//  - Stateful Construction: The StandardMazeBuilder holds the _maze instance locally
//    while it is being constructed. The result is only retrieved
//    via currentMaze once the Director (MazeGame.createMaze) finishes the sequence

//  - Complex Assembly Hiding: Unlike Abstract Factory, where the client links objects the Builder
//    here handles the linking Notice buildDoor in StandardMazeBuilder contains logic to
//    search the room list and calculate directional vectors. The Director is shielded from this

// Benefits

//  - Finer Control: The process is step-by-step the Director controls
//    exactly when a room is added or a door is built

//  - Isolation of Code: The details of how Wall objects are instantiated and assigned to Room sides
//    are entirely encapsulated in StandardMazeBuilder
//    the MazeGame contains no loops or array manipulation logic

//  - Reusability: You could write a JSONMazeBuilder that writes text strings instead of objects
//    passed to the exact same MazeGame and it would produce
//    a valid JSON output without changing the Game logic

// Liabilities

//  - Coupling to Construction Order: The Director (MazeGame) must know the logical constraints of the product
//    For example, it must call buildRoom before buildDoor
//    or the StandardMazeBuilder logic (finding indices) will crash
