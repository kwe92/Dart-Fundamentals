// Redirecting Constructor (Named Constructor)

//   - redirects to another constructor in the same class
//   - an Initalizer List that utilizing this keyword
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

// In the above example the named constructor redirects
// to a generative constructor

int main() {
  final Point p1 = Point.alongXaxis(42);
  final Point p2 = Point.alongYaxis(42.314159);
  final Point p3 = Point(42, 34);

  final List<Point> points = [p1, p2, p3];

  print('\n');

// enumerate over an Array of points
  enumerate(points);

  return 0;
}

void enumerate(Iterable iter) => iter.toList().asMap().forEach(
      (index, element) => print(
        '$index: $element\n',
      ),
    );
