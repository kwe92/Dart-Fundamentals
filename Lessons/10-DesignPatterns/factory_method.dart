import 'helper_functions.dart';
import 'maze_components.dart';

// TODO: Explain the Abstract Factory Pattern in your own words

class Spell {
  final name;
  Spell({required this.name});

  @override
  String toString() => 'Spell(name: $name)';
}

class EnchantedRoom extends Room{
  final Spell activeSpell;
  EnchantedRoom({
    required super.roomNo,
    required this.activeSpell
  });

  @override
  String toString() => 'Room(roomNo: $roomNo, activeSpell: $activeSpell)';
}

class DoorNeedingSpell extends Door {
  final Spell requiredSpell;
  DoorNeedingSpell({
    required super.r1,
    required super.r2,
    required this.requiredSpell
  });

  @override
  void enter(){}
}

class EnchantedMazeGame extends MazeGame {
  final List<Spell> roomSpells;
  final List<Spell> doorSpells;

  EnchantedMazeGame({required this.roomSpells, required this.doorSpells});

  @override
  Room makeRoom({required int roomNo}) => EnchantedRoom(roomNo: roomNo, activeSpell: createSpell(getRandom([for(int i = 0; i < roomSpells.length; i++) roomSpells[i].name])));

  @override
  Door makeDoor({required Room r1, required Room r2}) => DoorNeedingSpell(r1:r1, r2:r2, requiredSpell: createSpell(getRandom([for(int i = 0; i < doorSpells.length; i++) doorSpells[i].name])));

  Spell createSpell(String name) => Spell(name: name);

}

class MazeGame {
  Maze makeMaze()=> Maze();
  Wall makeWall()=> Wall();
  Room makeRoom({required int roomNo})=> Room(roomNo: roomNo);
  Door makeDoor({required Room r1, required Room r2})=> Door(r1:r1, r2:r2);

  Maze createMaze(){
    final maze = makeMaze();
    final r1 = makeRoom(roomNo: Room.currentRoomNums.length > 0 ? Room.currentRoomNums.last + 1 : 1);
    final r2 = makeRoom(roomNo: Room.currentRoomNums.last + 1);
    final door = makeDoor(r1: r1, r2: r2);
    final walls = [for(int i = 0; i < 6; i++)makeWall()];
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

void main(){
  final enchantedGame= EnchantedMazeGame(roomSpells: [Spell(name:'Enhanced map'), Spell(name:'Intangibility'), Spell(name:'Unlock IV')],
                                                    doorSpells: [Spell(name:'Lock I'),Spell(name:'Lock III'),Spell(name:'Lock V')]);
  
  final game = MazeGame();
  final maze = game.createMaze();
  final enchanteMaze = enchantedGame.createMaze();

  print(maze.rooms);
  print(enchanteMaze.rooms);
  }