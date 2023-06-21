// Switch Statement: Guard Clause

//   - evaluates an arbitrary boolean expression after matching
//   - add addition constraints
//   - If a gaurd clause is false it will fallthrough to the next case statement

class Point {
  final double x;
  final double y;
  const Point({
    required this.x,
    required this.y,
  });

  void euclideanDistance() {}

  @override
  String toString() => 'Point($x, $y)';
}

Point getPoint(arr) => switch (arr) {
      (double a, double b) => Point(x: a, y: b),
      _ => throw FormatException(),
    };

void main() {
  const (double, double) arr1 = (4.0, 2.0);
  final Point p1 = getPoint(arr1);
  print(p1);
}
