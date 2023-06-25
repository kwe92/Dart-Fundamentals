// Type Theory: Parameterized Types - Generics

//   - allows classes and functions to work with multiple types
//   - dynamically typed interfaces that retain tooling (complie-time type safety)
//   - Reduce code duplication
//   - Helps write type safe code

// replace place holder types explicitly during instantiation

// create a transform function that takes a list and a callback as a value

import 'dart:math';

class NotAnIterable extends Error {
  final String? message;
  NotAnIterable([this.message]);

  @override
  String toString() => message != null ? message! : super.toString();
}

Iterable transform<T>(T iterable, T Function(T) f) {
  if (iterable.runtimeType == Map && iterable != null) {
    final iter = iterable as Map<String, T>;
    return <T>[
      for (final ele in iter.values) f(ele),
    ];
  }
  if (iterable.runtimeType == Iterable && iterable != null) {
    return <T>[
      for (final ele in iterable as Iterable<T>) f(ele),
    ];
  }
  throw NotAnIterable('${iterable.runtimeType} is not of type Iterable.');
}

List<double> randDoubleArr(int length) => [
      for (var i = 0; i < length; i++) (Random().nextDouble() * 41) + 1,
    ];

void main() {
  try {} catch (error, stackTrace) {
  } finally {
    List<double> doubleArr = randDoubleArr(6);

    print('doubleArr: $doubleArr');

    final transformedArr = transform<List<double>>(doubleArr, (p0) => p0).toList();

    print('transformedArr ${transformedArr}');
  }
}
