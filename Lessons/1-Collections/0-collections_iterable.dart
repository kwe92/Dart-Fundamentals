// ignore_for_file: unused_catch_stack, unused_local_variable, unused_import

import 'dart:math';

// Iterable

//   - abstract class (can not be instantiated)
//   - data structure, representing a collection of Objects
//     called "elements" or "values" that can be accessed sequentially (linearly)
//   - List and Set classes are sub-classes of Iterable (Implementations of Iterable super-class)
//   - can be declared and initalized with List and Set generic literals (parameterized literals)
//   - if a variable is declare as an Iterable it can't be indexed using brackets

// Why have separate Implementations of Iterable?

// iterable[9]; // will throw a compile error

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
