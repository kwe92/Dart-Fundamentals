// TODO: expanded lesson to include type literals | Add more comments
//TODO:  type literals of all kinds are generics
// ?? <String>[] Map<String, int>()

// Generic Types

//   - allows an implementation to specify multiple types implicitly or explicitly
//   - uses a single capitalized letter to represent a placeholder type

// Placeholder Type

//   - A single capitalized letter that represents a placeholder type prior to initalization or a function being invoked
//   - the placeholder type can be used anywhere a default type can be used

// Parameterized Notation

//   - pass the placeholder type between angle brackets

// Explicit Parameterized

//   - you can explicitly define the range of types a placeholder type can be
//   - this is achieved by suffixing the place holder type with extends followed by what types it can be
//       - e.g. Type <T extends num, int, double>
//       - similar to TypeScripts:
//           type multiType = num || string

// Implicit Parameterized Type

//   - if extends is ommited e.g. <T>
//     the placeholder type can be on ANY known type
//     including nullable

//Generics Are reified

//   - reified means type information is retained at run-time but not compile-time
// tooling highlighting may not always show the corrent type

// Generic Class Implementation Example
//   - explicitly expecting one of three specified types

import 'dart:math';

abstract base class AbstractBasePoint<T extends num, int, double> {
  final T x, y;
  const AbstractBasePoint({
    required this.x,
    required this.y,
  });

  T euclideanDistance(Point orther);
}

final class Point<T extends num, int, double> extends AbstractBasePoint {
  const Point({required super.x, required super.y});

  @override
  T euclideanDistance(Point other) {
    final result = sqrt(
      pow((other.x - this.x), 2) + pow((other.y - this.y), 2),
    ) as T;
    return result;
  }
}

// the above class instance variables can be of any non-nullable type

class Point2<T extends Object> {
  final T x, y;
  const Point2({
    required this.x,
    required this.y,
  });
}

void main() {
  // final Point p0 = Point(x: 4, y: 3.14);

// the bellow code will through a run time error
  // final Point2 p1 = Point2(x: null, y: '');

  // type information is retained at run-time
  // print('\nx run time type: ${p0.x.runtimeType}\n');
  // print('y run time type: ${p0.y.runtimeType}\n');
}
