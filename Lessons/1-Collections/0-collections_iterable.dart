// ignore_for_file: unused_catch_stack, unused_local_variable, unused_import

import 'dart:math';

// Iterable

//   - abstract class (can not be instantiated)
//   - a data structure, representing a collection of Objects;
//    "elements" or "values" that can be accessed sequentially (linearly) O(n) worst case (asymptotic) time-complexity
//   - can be declared and initalized with List and Set literals or literal parameterized types
//   - List and Set classes are sub-classes of Iterable; implementations of the Iterable super-class
//   - if a List or Set literal is initalized as an Iterable it can't be indexed using brackets

// Why have separate Implementations of Iterable?

//    - separate implementations of Iterable types
//      allow sub-types (sub-classes) to
//      serve distinct purposes and maintain
//      separation of concerns (separation of behaviors between classes)

// Iterable.elementAt

//   - O(n) linear time complexity

typedef IntFunc = int Function(int);

void main() {
  // const arrays are frozen at compile-time

  // homogenous List of double floating point numbers
  const Iterable iterable = <double>[3.14, 0.001, 0.05];

  // homogenous List of Strings
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
