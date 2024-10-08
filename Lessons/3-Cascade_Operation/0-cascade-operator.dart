import 'dart:math';

enum Colors {
  black,
  green,
  blue,
  purple,
}

enum StrokeCap {
  butt,
  round,
  square,
}

class Paint {
  Colors? color;
  StrokeCap? strokeCap;
  double? strokeWidth;

  Paint({
    this.color,
    this.strokeCap,
    this.strokeWidth,
  });

  @override
  String toString() => 'Paint(color: $color, strokeCap: $strokeCap, strokeWidth: $strokeWidth)';
}

void main() {
  final randomInt = Random().nextInt;

  int randIntRange(int min, int max) => randomInt.call((max - min)) + min;

  // instantiate mutable instance
  Paint paint = Paint();

  // Reasign Object Properties Using Cascade Notation

  //   - requires only one temporary variable and semicolon for all reassigned properties
  paint
    ..color = Colors.values[randomInt.call(Colors.values.length)]
    ..strokeCap = StrokeCap.values[randomInt.call(StrokeCap.values.length)]
    ..strokeWidth = randIntRange(1, 17).toDouble();

  print(paint);

  // Reasign Object Properties Using Default Syntax

  //   - requires a temporary variable and semicolon for all reassigned properties

  paint.color = Colors.values[randomInt.call(Colors.values.length)]; // temporary variable with semicolon

  paint.strokeCap = StrokeCap.values[randomInt.call(StrokeCap.values.length)]; // temporary variable with semicolon

  paint.strokeWidth = randIntRange(1, 17).toDouble(); // temporary variable with semicolon

  print(paint);
}

// Cascade notation

//   - (.., ?..)

//   - do a sequence of operations on the same object
//     allowing access to member variables and methods

// why Use Cascade Notation?

//   - reasign properties without the need to specify the object multiple times

//   - create less temporary variables

// Stateful (Mutable) Objects

//   - only seems useful on mutable object
