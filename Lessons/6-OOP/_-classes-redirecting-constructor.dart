// Redirecting Constructor

//   - as the name implies it is a constructor that redirects
//   - its only purpose is to redirect
//     to another constructor in the same class
//   - an initalizer list that uses this keyword
//     instead of the instance variables or class name directly

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  Point.alongXaxis(double x) : this(x, 3.14159);
  Point.alongYaxis(double y) : this(3.14159, y);

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

int main() {
  final Point p1 = Point.alongXaxis(42);
  final Point p2 = Point.alongYaxis(42);
  final Point p3 = Point(42, 34);

  List<Point> points = [p1, p2, p3];

  for (Point point in points) {
    print(point);
  }

  return 0;
}
