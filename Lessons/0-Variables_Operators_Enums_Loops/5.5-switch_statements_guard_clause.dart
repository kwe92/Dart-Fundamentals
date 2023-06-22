// Switch Statement: Guard Clause

// when keyword
//   - optional guard clause after a case clause is matched
//   - evaluates an arbitrary boolean expression
//   - adds additional constraints
//   - false gaurd clauses fallthrough

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

  @override
  bool operator ==(Object other) => identical(this, other) ? true : other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

// function returning a switch expression
Point getPoint(Pair pair) => switch (pair) {
      (double a, double b) when a >= b && b > 0 => Point(x: a, y: b),
      _ => throw PointException(
          message: 'x must be greater than y and y must be greater than 0.',
        ),
    };

// type signature
typedef Pair = (double a, double b);

// custom exception
class PointException extends Error {
  final String message;
  PointException({required this.message});

  @override
  String toString() => message;
}

void main() {
  // try, catch, finally to handle error
  try {
    const Pair pair0 = (3, -7);
    final Point p0 = getPoint(pair0);
    print('p0: $p0');
  } catch (errorMsg, stackTrace) {
    print('\n$errorMsg\n');
    printStackTrace(stackTrace);
  } finally {
    const Pair pair1 = (4.0, 2.0);
    final Point p1 = getPoint(pair1);
    print('Point1: $p1\n');
  }
}

// Prints Stack Trace of a call sequence triggering an exception

void printStackTrace(StackTrace stackTrace) => stackTrace
    .toString()
    .split('#')
    .where(
      // filter predicate
      (String stackTraceEle) => stackTraceEle.trim().length > 0,
    )
    .forEach(
      // for each stack trace message print the message
      (String stackTraceEle) => print('#${stackTraceEle.trim()}\n'),
    );
