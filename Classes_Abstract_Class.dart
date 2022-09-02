import 'dart:math';

// Abstract Classes
abstract class Shape {
  double get area;
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

class Triangle extends Shape {
  Triangle(this.a, this.b, this.c);
  final double a;
  final double b;
  final double c;

  @override
  double get area => round(_getArea(a, b, c), 4);

  double get height => round(_getArea(a, b, c) / (0.5 * b), 4);

  double get base => b;

  // Area of a triangle using Heron's Formula and a private method
  double _getArea(var a, var b, var c) {
    var s = (a + b + c) / 2;
    var result = sqrt(s * ((s - a) * (s - b) * (s - c)));
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
}

void printArea(Shape shape) => print(round(shape.area, 2));

double round(num n, [var p = 0]) => double.parse(n.toStringAsFixed(p));
