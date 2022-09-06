// Factory Constructors
//    - Most commonly used to parse JSON data
//    - Useful when implementing a constructor that doesnt always create a
//      new instance of its class
//    - Initalize a final variable using logic that cant be hanlded
//      in a initalizer list

import 'dart:convert';
import 'dart:math';

abstract class Shape {
  double get area;

  const Shape();

  factory Shape.fromJSON(Map<String, Object> json) {
    final type = json['type'];
    switch (type) {
      case 'Square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        } else {
          throw UnsupportedError('$type is not of type double');
        }
      case 'Circle':
        final radius = json['radius'];
        if (radius is double) {
          return Circle(radius);
        } else {
          throw UnsupportedError('$type is not of type double');
        }
      default:
        throw UnsupportedError('$type is not of type Square');
    }
  }
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

void main() {
  final List<Map<String, Object>> jsonData = [
    {'type': 'Circle', 'radius': 15.0},
    {'type': 'Square', 'side': 6.0},
    {'type': 'Circle', 'radius': 5.0}
  ];

  final List<Shape> shapeList = [
    for (var json in jsonData) Shape.fromJSON(json)
  ];

  print(shapeList);

  shapeList.forEach((element) => print(round(element.area, 2)));
}

double round(num n, [p = 0]) => double.parse(n.toStringAsFixed(p));
