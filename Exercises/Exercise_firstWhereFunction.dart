// ignore_for_file: unused_local_variable, unused_import

// Implement a 'firstWhere' function that takes arguments:
//      - A List
//      - A boolean function arg that evaluates all items of the List
//      - A named 'orElse' function that returns a value if no match is found
//      - The custom 'firstWhere' function should return the first true search condition
//        if no element matches the search condition then return the value of 'orElse' function
// Use Generics to work with values of any type

import 'dart:io';
import 'dart:math';

void main() {
  List<int> intList = randIntList(10, 25);

  print(intList);

  print(firstWhere<int, int>(intList, (x) => x > 20, orElse: (() => -1)));
}

List<int> randIntList(var n, var r) => <int>[for (var i = 0; i < n; i++) Random().nextInt(r)];

T firstWhere<T, R>(List<T> collection, bool Function(T) f, {required T Function() orElse}) {
  for (var x in collection) {
    if (f(x)) return x;
  }
  return orElse();
}
