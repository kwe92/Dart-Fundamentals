import 'dart:math';

// Class Implementation

// mutable Class

//   - also known as a stateful class
//   - state of the data can change throughout the program

class Point {
  double x, y;

  // named parameters use {} and prefix variables with required
  Point({required this.x, required this.y});

  @override
  String toString() => 'Point($x, $y)';

  double euclideanDistance(Point other) => sqrt(
        pow((other.x = this.x), 2) + pow((other.y - this.y), 2),
      );
}

int main() {
  Point p1 = Point(x: 4, y: 3);
  Point p2 = Point(x: 3, y: 6);
  print('inital point: $p1');

  // square the Point changing its internal state
  p1
    ..x = pow(p1.x, 2).toDouble()
    ..y = pow(p1.y, 2).toDouble();

  print('squared point: $p1');
  print('Distance Function: ${p2.euclideanDistance(p2)}');

  return 1;
}
