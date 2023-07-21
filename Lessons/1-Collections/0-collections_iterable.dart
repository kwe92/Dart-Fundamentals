// ignore_for_file: unused_catch_stack, unused_local_variable, unused_import

import 'dart:math';

// Iterable

//   - abstract class (can not be instantiated)
//   - a data structure, representing a collection of Objects;
//     "elements" or "values" that can be accessed sequentially (linearly) O(n) worst case (asymptotic) time-complexity
//   - can be declared and initalized with List and Set literals or literal parameterized types
//   - List and Set classes are sub-classes of Iterable; implementations of the Iterable super-class
//   - if a List or Set literal is initalized as an Iterable it can't be indexed using brackets

// All Implementors (sub-types / sub-classes) of the Iterable Abstract Class in Dart

//   - most commonly used implementors:

//       - List
//       - Set

//   - least commonly used implementors:

//       - LinkedList
//       - Queue
//       - DoubleLinkedQueue
//       - ListQueue
//       - Runes
//       - SplayTreeSet

// Why have separate Implementations (sub-classes) of Iterable?

//    - separate implementations of the Iterable types
//      allows sub-types (sub-classes) to serve distinct
//      purposes as individual data structures and maintain
//      separation of concerns (separation of behaviors between sub-types)

typedef IntFunc = int Function(int);

void main() {
  // Example: const Iterable

  //   - frozen at compile-time (unmodifiable iterable)
  //   - initalized with a parameterized literal
  //   - declared as an Iterable type (tooling can know what the class can and can't do | what methods and properties it has)

  // homogenous Iterable of double floating point numbers
  const Iterable iterable = <double>[3.14, 0.001, 0.05];

  // homogenous Iterable of Strings
  const Iterable heroNamesTest = <String>['Goku', 'Naruto', 'Gon', 'Deku'];

  try {
    // a compile-time error is thrown (caught by tooling, you can't run this code)
    // heroNamesTest[3] = 'Almight';
  } catch (errorMessage, stackTrace) {
    print('\nError Message: $errorMessage\n');
  } finally {
    print('\nSome anime charaters $heroNamesTest\n');
  }
}
