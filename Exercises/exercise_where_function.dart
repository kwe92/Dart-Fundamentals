// Excercise: Implement the 'where' function
// Return odd numbers from a generated List of ints

// Implement a 'where' function that takes two arguements:
//    - A list of items
//    - A function arg
//    - The Function should filter items of a List with a Boolean condition
//    - return a new list of filtered items

import 'dart:math';

void main() {
  List<int> intList = randIntList(25, 8);
  List<int> filteredList =
      filterList<int, int>(intList, (x) => x % 2 == 0 && x > 0);
  print(intList);
  print(filteredList);
}

List<int> randIntList(var n, var r) =>
    [for (var i = 0; i < n; i++) Random().nextInt(r)];

List<R> filterList<T, R>(List<T> collection, bool Function(T) f) {
  var result = <R>[
    for (var ele in collection)
      if (f(ele) == true) ele as R
  ];
  return result;
}

int isEven(var x) {
  if (x % 2 == 0 && x > 0)
    return 1;
  else
    return 0;
}
