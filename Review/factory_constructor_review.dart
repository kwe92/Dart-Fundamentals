// Create a factory Constructor for the Shape class
// It should take a map as a arg

import 'dart:math';

import '../utility/round.dart';

abstract class Shape {
  Shape();

  factory Shape.fromJSON(Map<String, Object> json) {
    final type = json['type'];

    switch (type) {
      case 'Circle':
        final radius = json['radius'];
        if (radius is num) {
          return Circle(radius.toDouble());
        } else {
          throw UnsupportedError('$type is not a Circle.');
        }
      case 'Square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        } else {
          throw UnsupportedError('$type is not a Square.');
        }
      default:
        throw UnsupportedError('$type is not defined as a Shape');
    }
  }

  double get area; // abstract getter method
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => round(pi * radius * radius, 2);
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => round(side * side, 2);
}

void main() {
  final Map<String, Object> json = {'type': 'Circle', 'radius': 5};
  final Shape c1 = Circle(10);

  final Shape someShape = Shape.fromJSON(json);

  print(c1.area);
  print(someShape.area);
}
