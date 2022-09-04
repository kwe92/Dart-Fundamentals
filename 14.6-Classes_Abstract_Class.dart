// TODO: Add Explanatory Comments

import 'dart:math';

// Abstract Class
//    - A class that defines an interface thast can be implemented
//    - You can implement this interface class accross many sub-classes
//    - Can not be instantiated

abstract class Shape {
  double get area; // Abstract getter variable - (Required)
  double get perimeter; // Abstract getter variable - (Required)

  // A function that is implemented - (Not Required)
  void printValues() => print('Area: $area | Perimeter: $perimeter');
}

// extending the interface of Shape to its child Square
class Square extends Shape {
  Square(this.side);
  final double side;

  // defining required implementation
  @override
  double get area => round(side * side);

  // defining required implementation
  @override
  double get perimeter => round(4 * side, 2);
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => round(pi * radius * radius, 2);

  @override
  double get perimeter => round(2 * pi * radius, 2);
}

class Triangle extends Shape {
  Triangle(this.a, this.b, this.c);
  final double a;
  final double b;
  final double c;

  double get base => b;

  @override
  double get area => round(_getArea(a, b, c), 4);

  double get perimeter => round((a + b + c));

  double get height => round(_getArea(a, b, c) / (0.5 * b), 4);

  // defining optional implementation
  @override
  void printValues() =>
      print('Area: $area | Perimeter: $perimeter | Height: $height');

  // Area of a triangle using Heron's Formula and a private method
  double _getArea(final double a, final double b, final double c) {
    final s = (a + b + c) / 2;
    final result = sqrt(s * ((s - a) * (s - b) * (s - c)));
    return result;
  }
}

void main() {
  final Shape c1 = Circle(6);
  final Shape s1 = Square(4);
  final Triangle t1 = Triangle(9, 10, 11);

  final List<Shape> listOfShapes = [c1, s1, t1];

  print('Area of c1: ${round(c1.area, 2)}');
  print('Area of s1: ${s1.area}');
  print('Area of t1: ${t1.area}');
  print('Height of t1: ${t1.height}');
  print('Base of t1: ${t1.base}');

  listOfShapes.forEach(printArea);

  listOfShapes.forEach((shape) => shape.printValues());
}

void printArea(final Shape shape) => print(round(shape.area, 2));

double round(final num n, [var p = 0]) => double.parse(n.toStringAsFixed(p));
