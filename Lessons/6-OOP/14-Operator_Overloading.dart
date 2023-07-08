// Operator Overloading - (Without covariant)
//    - Define how operators should function with your class
//    - Can throw exceptions to generate run time errors

// Point(1,1) == Point(1,1) should return true
// override the operator if Object is a point compare the points and return false other wise

class TypeError implements Exception {
  TypeError([this.msg = 'Wrong type.']) : super();
  final String msg;
  @override
  String toString() => 'TypeError: $msg';
}

class Point {
  const Point(this.x, this.y);
  final double x;
  final double y;

  @override
  int get hashCode => super.hashCode;

  bool operator ==(Object other) {
    if (other is Point) {
      return x == other.x && y == other.y; // boolean expression that evaluates to ture or false
    } else {
      return false;
    }
  }

  Point operator +(Object other) {
    if (other is Point) {
      return Point(x + other.x, y + other.y);
    } else {
      throw TypeError('${other.runtimeType} is not of type Point. '
          '\n'
          '$other + Point($x,$y) is not a valid operation.');
    }
  }

  @override
  String toString() => 'Point($x,$y)';
}

void main() {
  const Point p1 = Point(1, 1);
  const Point p2 = Point(1, 1);

  print(p1 == p2);

  print(p1 + p2);

  p1 + 1;
}
