//TODO: override hashCode or use equatable package
// Operator Overloading - (with covariant)
// Create a Point class and use operator overloading for:
//     - Relational Operator:
//        - ==
//     - Arithmetic Operators:
//        - subtraction, addition, multiplication, and division
// Bonus:
//  - Add Euclidean Distance formula method

import 'dart:math';

class TypeError implements Exception {
  TypeError([this.message = 'Wrong Type']) : super();
  final String message;

  @override
  String toString() => 'TypeError: $message';
}

class Point {
  Point(this.x, this.y);
  final double x;
  final double y;

  bool operator ==(Object other) {
    if (other is Point) {
      return x == other.x && y == other.y;
    } else {
      return false;
    }
  }

  Point operator +(covariant Point other) => Point(x + other.x, y + other.y);

  Point operator -(covariant Point other) => Point(x - other.x, y - other.y);

  Point operator *(Object other) {
    if (other is Point) {
      return Point(x * other.x, y * other.y);
    }
    if (other is num) {
      return Point(x * other, y * other);
    } else {
      throw TypeError('${other.runtimeType} must be a num or Point type.');
    }
  }

  Point operator /(covariant Point other) => Point(x / other.x, y / other.y);

  @override
  String toString() => 'Point($x, $y)';

  double euclideanDistance(Point p) {
    return round(sqrt(pow(p.x - x, 2) + pow(p.y - y, 2)), 2);
  }
}

void main() {
  final Point p1 = Point(2, 3);
  final Point p2 = Point(4, 1);
  print('$p1 + $p2 = ${p1 + p2}');
  print('$p1 - $p2 = ${p1 - p2}');
  print('$p1 * $p2 = ${p1 * p2}');
  print('$p1 * 5 = ${p1 * 5}'); // multiply a point by a scalar
  print('$p1 / $p2 = ${p1 / p2}');
  print('$p1 == $p2 = ${p1 == p2}');
  print(
      'Pythagorean distance between $p1 and $p2 = ${p1.euclideanDistance(p2)}');
  print(round(2 * sqrt(2), 2));
}

double pow(var x, var e) {
  if (e == 0) return 1;
  return x * pow(x, e - 1);
}

double round(num n, [var p = 0]) => double.parse(n.toStringAsFixed(p));
