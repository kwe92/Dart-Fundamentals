class Point {
  Point(this.x, this.y);
  final double x;
  final double y;
}

void main() {
  final Point p1 = Point(1, 1);

  final Point p2 = Point(1, 1);

  print(p1 == p2);
}
