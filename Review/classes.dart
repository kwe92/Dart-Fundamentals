import 'dart:math';

import '../utility/round.dart';

class Point {
  final x;
  final y;
  const Point(this.x, this.y);

  Point operator +(covariant Point other) => Point(this.x + other.x, this.y + other.y);
  Point operator /(covariant Point other) => Point(this.x + other.x, this.y / other.y);
  Point operator *(covariant Point other) => Point(this.x + other.x, this.y * other.y);
  Point operator -(covariant Point other) => Point(this.x + other.x, this.y - other.y);

  double euclideanDistance(Point other) => round(sqrt(pow((other.x - x), 2) + pow((other.y - this.y), 2)), 2);

  @override
  String toString() => "Point(${x}, ${y})";
}

int main() {
  Point p1 = Point(3, 4);
  Point p2 = Point(4, 7);
  print("x = ${p1.x}, y = ${p1.y}");
  print("distance: ${p1.euclideanDistance(p2)}");
  print(p1 * p2);
  return 0;
}
