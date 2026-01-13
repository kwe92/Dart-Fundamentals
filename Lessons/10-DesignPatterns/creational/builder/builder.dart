import '../../utils/helper_functions.dart';
import '../../utils/maze_components.dart';

abstract class MazeBuilder {
  Maze get currentMaze;

  void buildMaze();

  void buildRoom();

  void buildDoor(int roomFrom, int roomTo);
}

// Concrete Builder (REPRESENTATION)
class StandardMazeBuilder implements MazeBuilder {
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

// DIRECTOR
//  - Knows the order of operations
class MazeGame {
  // CONSTRUCTION
  static Maze createMaze({required MazeBuilder mazeBuilder}) {
    mazeBuilder.buildMaze(); // Step 1: Start
    mazeBuilder.buildRoom(); // Step 2: Add a room
    mazeBuilder.buildRoom(); // Step 3: Add another room
    mazeBuilder.buildDoor(
        mazeBuilder.currentMaze.rooms[0].roomNo, mazeBuilder.currentMaze.rooms[1].roomNo); // Step 4: Connect them with a door

    return mazeBuilder.currentMaze;
  }
}

void main() {
  final mazeBuilder = StandardMazeBuilder();
  final maze = MazeGame.createMaze(mazeBuilder: mazeBuilder);

  print(maze.rooms);

  for (var room in maze.rooms) {
    print(room.sides);
  }
}

// 1. Core Identity

      // Pattern Name: Builder
      // Category: Creational (Object)
      // Intent: Separate the construction of a complex object from its representation so that
      // the same construction process can create different representations.

// 2. The Problem & Solution (Motivation)

      // Scenario: A Game Engine needs to construct complex Maze levels consisting of interconnected
      // Rooms, Doors, and Walls.
      // Problem: The logic to assemble these parts is complex. For example, every Room needs
      // exactly 4 walls, and connecting a Door requires calculating directional vectors (North vs South)
      // and updating two different Room objects. Placing this "messy" math inside the Game logic
      // makes it hard to read and hard to change (e.g., if we wanted to generate a JSON save file instead).
      // Solution: Create a `MazeBuilder` interface. The `MazeGame` (Director) calls generic
      // high-level steps like `buildRoom()` or `buildDoor()`. The `StandardMazeBuilder` handles
      // the specific details of assembly and state management.

// 3. Participants (Mapped to Dart Sample)

      // Builder (MazeBuilder):
      
           // - Specifies the abstract interface (buildMaze, buildRoom) for creating parts.
      
      // ConcreteBuilder (StandardMazeBuilder):
            
            // - Constructs and assembles parts (e.g., initializes 4 Walls, resolves side connections).
            // - Stateful: Keeps track of the representation being built (`_maze`) locally.
            // - Exposes the result (`currentMaze`) only when finished.
            
      // Director (MazeGame):
            
            // - Constructs the object using the Builder interface.
            // - Defines the algorithm/sequence: "Start" -> "Room" -> "Room" -> "Door".
      
      // Product (Maze):
      
            // - The complex object under construction.

// 4. Consequences

      // Varying Internal Representation: You can change the product simply by swapping Builders.

      // - Example: You could write a `JSONMazeBuilder` that writes text strings instead of
      //   objects. It would work with the exact same `MazeGame` logic but produce JSON output.
      //   Isolation of Code: The details of how Wall objects are instantiated and assigned to
      //   Room sides are entirely encapsulated in the Builder.
      //   Liability - Coupling to Construction Order: The Director *must* know the logical
      //   constraints of the product.

      // - Risk: If `MazeGame` calls `buildDoor` before `buildRoom`, the Builder logic
      // (finding indices) will crash.

// 5. Implementation Issues

      // Assembly Model: Results can be appended to a stream or constructed in a graph.
      // No Abstract Product Class: Products from different builders (JSON vs. Objects) may
      // share no common interface.

// 6. Comparison with Related Patterns

      // Abstract Factory:

            // - Client Responsibility: The Client receives parts and must link them together.
            // - Return: Returns product immediately.

      // Builder:

            // - Builder Responsibility: The Builder handles the linking. The Client just says "Connect A to B".
            // - Return: Returns product at the end.

// 7. Sample Code Use Case & Analysis

      // Scenario: Maze Construction with Complex Logic.

      // Core Motivation (Why use Builder here?):

            // - The `MazeGame` needs a maze with rooms and doors.
            // - However, the math required to orient a door correctly (finding indexes, calculating
            //   vectors/oppositeDirection) is complex.
            // - By using a Builder, `MazeGame` simply issues high-level commands ("build a door"),
            //   and the `StandardMazeBuilder` handles the complex assembly logic.

      // Construction vs. Representation:

            // - Construction: The steps in `MazeGame` (Step 1..4).
            // - Representation: The object `_maze` inside the Builder.
            // - If you pass `EnchantedMazeBuilder`, the Construction steps stay exactly the same,
            //   but the Representation changes completely.
