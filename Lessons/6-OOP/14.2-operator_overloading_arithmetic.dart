import 'dart:math';

import '../../utility/round.dart';

class TypeError implements Exception {
  TypeError([this.message = 'Wrong Type']);
  final String message;

  @override
  String toString() => 'TypeError: $message';
}

class Point {
  final double x;

  final double y;

  const Point(this.x, this.y);

  double euclideanDistance(Point p) => round(sqrt(pow(p.x - x, 2) + pow(p.y - y, 2)), 2);

  bool operator ==(covariant Point other) => x == other.x && y == other.y;

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

  @override
  int get hashCode => super.hashCode;
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
  print('Pythagorean distance between $p1 and $p2 = ${p1.euclideanDistance(p2)}');
}

// Operator Overloading - (with covariant)

// covariant

//   - removes the need to check the type
//     when using operator overloading