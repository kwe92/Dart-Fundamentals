// ignore_for_file: unused_catch_stack
// TODO: fix comments

// Type Theory: Parameterized Types - Generics

//   - parameterized types define a family of related types
//   - the family is obtained by instantiating the parameterized type
//      - producing an instantiation
//   - classes and functions can work with multiple types
//   - dynamically typed interfaces that retain tooling (complie-time type safety)
//   - Reduce code duplication
//   - Helps write type safe code

// assignment

//   - variable assigned a specified type

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
