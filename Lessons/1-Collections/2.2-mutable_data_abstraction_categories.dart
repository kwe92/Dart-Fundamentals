void main() {
  var arr0 = <int>[1, 2, 3, 4];

  print("Observer method List.length on List arr0: ${arr0.length}");

  print("Observer method List.elementAt(3) on List arr0: ${arr0.elementAt(3)}");

  var arr1 = List<int>.from({5, 6, 7, 8});

  print("Producer method List.from, this example creates a List from a Set but the elements themselves remain the same: ${arr1}");

  arr1.add(42);

  print("Mutator method List.add, which has the side effect of mutating the List arr1: $arr1");
}


// CS 312 Lecture 10 & 16 | https://web.mit.edu/6.031/www/sp22/classes/10-abstract-data-types/

// Mutable Data Abstractions

// Abstract Data Type Operation Classifications

// Observers

//   - return information about an abstract data type without mutation

// Creators

//   - creates an instance an abstract data type without mutating the original abstraction

// Producers

//   - creates an Object of a type given one or more existing objects

// Mutators | methods or functions with side-effects

//   - mutates an abstract data type in some way
//   - produces some side effect that the user should be informed about