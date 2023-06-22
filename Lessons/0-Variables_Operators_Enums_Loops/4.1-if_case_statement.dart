// if case statements

//   - Dart if statements now support if clauses followed by a pattern
//   - A way to match the destructure ]of an object to a single pattern

// when gaurd clause

//   - used to evaluate a arbitrary boolean expression
class Point {
  final double x;
  final double y;
  const Point({
    required this.x,
    required this.y,
  });

  @override
  String toString() => "Point($x, $y)";
}

const List<double> pair = [4.0, 2.0];
const List<double> triplet = [2.12, 43.3, 5.6];

Point? getPoint(Iterable pair) {
  if (pair case [double x, double y] when x > y && y > 0) {
    return Point(x: x, y: y);
  }
  return null;
}

void main() {
  final Point? p1 = getPoint(pair);
  final Point? p2 = getPoint(triplet);

  print('Point 1: $p1');
  print('Point 2: $p2');
}

// Summary

// - patternsallow  you to use case clauses in if-statements
// - If the pattern matches the value then the branch executes with any variables the pattern defines in scope