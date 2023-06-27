// Factory Constructors

//    - mused to parse JSON data
//    - useful when implementing a constructor that doesnt always create a
//      new instance of its class
//    - initalize a final variable using logic that cant be hanlded
//      in a initalizer list

import 'dart:math';

abstract class Shape {
  double get area;

  const Shape();

  factory Shape.fromJSON(Map<String, Object> json) {
    final [type, side, radius] = json.values.toList();

    return switch (type) {
      'Square' => side is double ? Square(side) : throw UnsupportedError('$type is not of type double'),
      'Circle' => radius is double ? Circle(radius) : throw UnsupportedError('$type is not of type double'),
      _ => throw UnsupportedError('$type is not of type Square')
    };
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
    for (var json in jsonData) Shape.fromJSON(json),
  ];

  print(shapeList);

  shapeList.forEach(
    (shape) => print(
      round(shape.area, 2),
    ),
  );
}

double round(num n, [p = 0]) => double.parse(
      n.toStringAsFixed(
        p,
      ),
    );
