import 'package:equatable/equatable.dart';

class Point extends Equatable {
  const Point(this.x, this.y);
  final double x;
  final double y;

  @override
  // Abstract computed variable that must be implemented
  // Properties that will be compared
  List<Object?> get props => [x, y];

  @override
  // Optional implementation that allows you to return the toString method
  bool? get stringify => true;
}

void main() {
  final Point p1 = Point(6, 3);
  final Point p2 = Point(5, 9);
  final Point p3 = Point(6, 3);

  print('$p1 == $p2: ${p1 == p2}');
  print('$p1 == $p3: ${p1 == p3}');
}
