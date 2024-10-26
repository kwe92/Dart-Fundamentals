void main() {
  try {
    const Pair pair0 = (3, -7);

    final Point p0 = point(pair0);

    print('p0: $p0');
  } catch (err, _) {
    print(err.toString());
  } finally {
    const Pair pair1 = (4.0, 2.0);

    final Point p1 = point(pair1);

    print('Point1: $p1');
  }
}

class Point {
  final double x;
  final double y;
  const Point({
    required this.x,
    required this.y,
  });

  @override
  String toString() => 'Point($x, $y)';
}

typedef Pair = (double a, double b);

Point point(Pair pair) => switch (pair) {
      (double a, double b) when a >= b && b > 0 => Point(x: a, y: b),
//                         ^^^^^^^^^^^^^^^^^^^^ gaurd clause
      _ => throw Exception('x and y must be positive integers and x must be greater than y.'),
    };

//Guard Clause

//   - optional guard clause can be set after a case clause

//   - can be used anywhere case clauses are used (if case, switch statements, and switch expressions)

//   - evaluates an arbitrary boolean expression

//   - adds additional constraints on case body execution

//   - false gaurd clauses fallthrough, continuing to the next case instead of exiting the switch
//     unlike if statements which will exitthe switch if false