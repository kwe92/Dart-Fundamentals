import 'dart:math';

sealed class Shape {
  const Shape();
}

class Circle implements Shape {
  final double radius;
  const Circle({
    required this.radius,
  });

  @override
  String toString() => 'Circle(radius: $radius)';
}

class Square implements Shape {
  final double length;
  const Square({
    required this.length,
  });

  @override
  String toString() => 'Square(length: $length)';
}

double getArea(Shape shape) => switch (shape) {
      Square(length: final l) => l * l,
      Circle(radius: final r) => pi * r * r,
    };

void main() {
  const square = Square(length: 19);
  const circle = Circle(radius: 1);
  final circleArea = getArea(circle);

  final squareArea = getArea(square);

  print('$square has an area of $squareArea');
  print('$circle has an area of $circleArea');
}
