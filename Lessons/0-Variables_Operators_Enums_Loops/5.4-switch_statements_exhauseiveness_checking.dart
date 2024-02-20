import 'dart:math';

// Exhaustiveness: Switch Statements

//   - All possible outcomes must be exhausted
//   - compiletime error if a value does not match a case within a switch statement
//   - Allows you to use dart in a more functional way

// Exhaustiveness: Enumerated and sealed types

//   - enumerated and sealed types do not require a default case
//   - all possible values are known and fully enumerable
//   - implies that a switch on any type is exhaustive
//       - does not require a default case or _ (wild card pattern)

sealed class Shape {
  const Shape();

  double getArea() => switch (this) {
        Square(length: final l) => l * l,
        Circle(radius: final r) => pi * r * r,
      };
}

class Circle extends Shape {
  final double radius;
  const Circle({
    required this.radius,
  });

  @override
  String toString() => 'Circle(radius: $radius)';
}

class Square extends Shape {
  final double length;
  const Square({
    required this.length,
  });

  @override
  String toString() => 'Square(length: $length)';
}

void main() {
  const square = Square(length: 19);
  const circle = Circle(radius: 3);
  print('$square has an area of ${square.getArea()}');
  print('$circle has an area of ${circle.getArea()}');
}
