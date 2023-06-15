// base class modifier
//   - base classes must have their signatures implemented
//   - Can not be implemented outside of its own module (library)
//   - Can be instantiated, but why would you

import 'dart:math';

base class BasePoint {
  final double x;
  final double y;
  const BasePoint({required this.x, required this.y});

  void euclideanDistance(BasePoint point) {}
}

final class Point extends BasePoint {
  const Point({required super.x, required super.y});

  double euclideanDistance(BasePoint point) => sqrt(
        pow((point.x - this.x), 2) + pow((point.y - this.y), 2),
      );
}

final class Point2 extends Point {
  const Point2({required super.x, required super.y});
}

final class Point3 implements BasePoint {
  double get x => throw UnimplementedError();
  double get y => throw UnimplementedError();

  @override
  void euclideanDistance(BasePoint point) {}
}

void main() {
  final point1 = Point(x: 4, y: 2);
  print(point1.euclideanDistance(Point(x: 16, y: 12)));
}
