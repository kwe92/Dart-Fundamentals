// Opertor overloading

//   - distinct from method overriding
//   - operator overloading is a compile-time polymorphism
//   - gives common operators user-defined meanings
//   - e.g. the addition of two strings concatenates them

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) {
    // if (identical(this, other)) return true;

    return other is Point && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

void main() {
  final p0 = Point(3, 4);
  final p1 = Point(42, 3.124);
  final p2 = Point(3, 4);

  print('p0 == p1: ${p0 == p1}');
  print('p1 == p2: ${p0 == p2}');
}
