// ignore_for_file: unused_catch_stack

// Type Theory: Parameterized Types - Generics

//  - defines a family of related types
//  - retain tooling (complie-time type safety)
//  - classes and functions can work with multiple types
//  - Reduce code duplication
//  - Helps write type safe code

// replace place holder parameter types explicitly during instantiation

import 'dart:math';

class NotAnIterable extends Error {
  final String? message;
  NotAnIterable([this.message]);

  @override
  String toString() => message != null ? message! : super.toString();
}

List<E> transform<T, E>(List<T> arr, E Function(T) f) => <E>[
      for (final ele in arr) f(ele),
    ];

List<double> randDoubleArr(int length) => [
      for (var i = 0; i < length; i++) (Random().nextDouble() * 41) + 1,
    ];

void main() {
  List<double> doubleArr = randDoubleArr(6);

  print('doubleArr: $doubleArr');

  final transformedArr = transform<double, double>(
    doubleArr,
    (p0) => pow(p0, 2).toDouble(),
  ).toList();

  print('transformedArr ${transformedArr}');
}
