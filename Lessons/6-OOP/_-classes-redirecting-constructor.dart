// Redirecting Constructor (named constructor)

//   - as the name implies it is a constructor that redirects
//     to another constructor in the same class
//   - an initalizer list that utilizing this keyword
//     instead of the instance variables or class name directly

class Point {
  static final _pi = 3.14159;
  final double x;
  final double y;

  const Point(this.x, this.y);

// Redirecting Constructor (Initalizer List)
  Point.alongXaxis(double x) : this(x, _pi);
  Point.alongYaxis(double y) : this(_pi, y);

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

int main() {
  final Point p1 = Point.alongXaxis(42);
  final Point p2 = Point.alongYaxis(42.314159);
  final Point p3 = Point(42, 34);

  final List<Point> points = [p1, p2, p3];

  print('\n');

  points.asMap().forEach((index, point) => print('$index: $point'));

  return 0;
}
