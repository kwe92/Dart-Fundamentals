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

const (double, double) pair = (4.0, 2.0);

const (double, double, double) triplet = (2.12, 43.3, 5.6);

Point? point(Record point) {
  if (pair case (double x, double y) when x > y && y > 0) {
    return Point(x: x, y: y);
  } else {
    return null;
  }
}

void main() {
  final Point? p1 = point(pair);

  final Point? p2 = point(triplet);

  print('Point 1: $p1');
  print('Point 2: $p2');
}

// if case statements

//   - Dart if statements with case clauses followed by a pattern

//   - A way to match and destructuring an object against a single pattern

// when gaurd clause

//   - used to evaluate an arbitrary boolean expression
//     after a case clause

// Summary

//   - patterns allow you to use case clauses in if-statements

//   - If the pattern matches the value then the branch executes with any variables the pattern defines in scope

//   - you can add a guard clause to evaluate boolean expressions against a case clause after matching