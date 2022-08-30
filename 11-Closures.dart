// Closures in dart
//    - Closures are anonymous functions that use a variable outside of its scope

/// The entry point of any program
void main() {
  var myList = [1, 2, 3, 4];
  var multiplier = 2;
  // Collections.map
  //    - the map function does not modify the elements of a collection inplace
  //      returns a lazy iterable
  //      Lazy iterable
  //          - The map function is not called only referenced until used

  Iterable newIter = myList.map(
    (element) => element * multiplier,
  );

  print('newIter value: $newIter');
  print('Run time type of newIter: ${newIter.runtimeType}');

  // Iterables are not Lists
  // The bellow code will not run if uncommented
  // List newList = newIter;

  // The as operator will throw an error as well
  // List newList = newIter as List;

  // To create a list of the elements contained in the Iterable use
  // .toList() method
  List newList = newIter.toList();
  print('Run time type of newList2: ${newList.runtimeType}');
}