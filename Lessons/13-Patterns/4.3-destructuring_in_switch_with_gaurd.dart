import 'dart:math';

abstract class Shape {
  final double size;

  Shape({required this.size});

  @override
  String toString() => 'Shape(size: $size)';
}

class Circle extends Shape {
  Circle({required super.size});
}

class Square extends Shape {
  Square({required super.size});
}

void main() {
  final truthValue = Random().nextBool();

  final shape = truthValue ? Circle(size: 40) : Square(size: 0);

  print(shape);

  switch (shape) {
    // Object Destructuring Pattern with gaurd
    case Circle(size: var s) || Square(size: var s) when s > 0:
      print('Non-empty symmetric shape');

    default:
      print('empty symmetric shape');
  }
}
