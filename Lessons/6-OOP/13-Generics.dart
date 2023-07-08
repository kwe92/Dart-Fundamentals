// Generic Types

//   - allows an implementation to specify multiple types explicitly
//   - uses single capitalized letter by convention
//   - use parameterized notation <...> to specify what the type will be
//       - if extends is ommited e.g. <T> then the
//         arguments to your implementation can be of ANY type, including nullable
//   - generics are reified meaning type information is retained at run-time

// generic classs that is explicitly expecting one of three specified types

class Point<T extends num, int, double> {
  final T x, y;
  const Point({
    required this.x,
    required this.y,
  });
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
  final Point p0 = Point(x: 4, y: 3.14);

// the bellow code will through a run time error
  // final Point2 p1 = Point2(x: null, y: '');

  // type information is retained at run-time
  print('\nx run time type: ${p0.x.runtimeType}\n');
  print('y run time type: ${p0.y.runtimeType}\n');
}
