import 'dart:math';

// Generic Types (Parameterized Types)

//   - allows implementations to specify multiple types using extends keyword
//   - avsingle capitalized letter represents placeholder types

// Placeholder Type

//   - a single capitalized letter representing a placeholder type
//     prior to initalization or a function being invoked
//   - placeholder types can be used anywhere a default type can be used or returned

// Parameterized Notation

//   - pass the placeholder type between angle brackets

// Explicit Placeholder Types

//   - placeholder types can be explicitly defined
//     by suffixing the placeholder with extends
//     followed by what type it will be:
//       - e.g. <T extends Object>
//       - typically used to ensure an Object is non-null when generic

//Generics Are reified

//   - reified means type information is retained at run-time
//     but not at compile-time, if the type is not parameterized
//     then the compile-time tooling type is
//     dynamic by default until run-time

// Generic Class Implementation Example

abstract base class AbstractBasePoint<T> {
  final T x, y;
  const AbstractBasePoint({
    required this.x,
    required this.y,
  });

  T euclideanDistance(Point other);

  @override
  String toString() => 'Point($x, $y)';
}

final class Point<T> extends AbstractBasePoint {
  const Point({required super.x, required super.y});

  @override
  T euclideanDistance(Point other) {
    final T distance = sqrt(
      pow((other.x - this.x), 2) + pow((other.y - this.y), 2),
    ) as T;
    return distance;
  }
}

void main() {
  // parameterized type information is ommited
  // so the compile-time type is Point<dynamic>

  final Point p0 = Point(x: 4, y: 3.14);
  final Point p1 = Point(x: 3.124, y: 42);
  final distance = p0.euclideanDistance(p1);

  // the reified run-time type information is retained
  print('\nx run time type: ${p0.x.runtimeType}\n');
  print('y run time type: ${p0.y.runtimeType}\n');

  print('euclidean distance between:\n\n$p0 and $p1:\n\n${distance}\n');
}
