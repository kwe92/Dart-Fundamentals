import 'dart:math';

enum Direction {north, south, east, west}

T getRandom<T>(List<T> items){
  final random = Random();

  final randomIndex = random.nextInt(items.length);

  T randomItem = items[randomIndex];

  return randomItem;
}

Direction getOppositeDirection(Direction direction) => switch (direction) {
      Direction.north => Direction.south,
      Direction.south => Direction.north,
      Direction.east => Direction.west,
      Direction.west => Direction.east,
    };