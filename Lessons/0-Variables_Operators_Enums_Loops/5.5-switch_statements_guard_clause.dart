// Switch Statement: Guard Clause

//   - evaluates an arbitrary boolean expression after matching
//   - adds additional constraints
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

  @override
  bool operator ==(Object other) => identical(this, other) ? true : other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

// function returning a switch expression
Point getPoint(Pair pair) => switch (pair) {
      (double a, double b) when a >= b && b > 0 => Point(x: a, y: b),
      _ => throw PointException('x must be greater than y and y must be greater than 0.'),
    };

// type signature
typedef Pair = (double a, double b);

// custom exception
class PointException extends Error {
  final String? message;
  PointException([this.message]);

  @override
  String toString() => message ?? super.toString();
}

void main() {
  try {
    const Pair pair0 = (3, -7);
    final Point p0 = getPoint(pair0);
    print(p0);
  } catch (errorMsg, stackTrace) {
    print('\n$errorMsg\n');

    stackTrace.toString().split('#').forEach((stackTrackMessage) {
      print('$stackTrackMessage\n');
    });
  } finally {
    const Pair pair1 = (4.0, 2.0);
    final Point p1 = getPoint(pair1);
    print('Point1: $p1');
  }
}
