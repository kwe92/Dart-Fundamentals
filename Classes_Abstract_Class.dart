import 'dart:html';
import 'dart:math';

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
  double get area => 1;
}

void main() {
  final Shape c1 = Circle(6);
  final Shape s1 = Square(4);

  print('Area of c1: ${round(c1.area, 2)}');
  print('Area of s1: ${s1.area}');
}

void printArea(Shape shape) => print(shape.area);

double round(num n, [var p = 0]) => double.parse(n.toStringAsFixed(p));
