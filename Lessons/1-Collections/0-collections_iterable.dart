import 'dart:math';

// Iterable

//   - abstract class (can not be instantiated)
//   - data structure, represents a collection of elements
//     or "values" that can be accessed sequentially (linearly)
//   - Sets and Lists are sub-classes of Iterable
//   - can be declared and initalized with List and Set generic literals
//   - if a variable is declare as an Iterable it can't be indexed using brackets

// Iterable.iterator

// Iterable: List

//   - 0-based indexed array
//   - one-to-one correspondence to Whole numbers {0, 1, 2, 3,...}
//   - non-homogeneous by default
//   - List literals [] can be declared as Interable

// iterable[9]; // will throw a compile error

// Iterable.elementAt

//   - O(n) linear time complexity

typedef IntFunc = int Function(int);

void main() {
  const Iterable iterable = <double>[3.14, 0.001, 0.05];

  // const arrays are frozen at compile-time
  const Iterable heroNamesTest = <String>['Goku', 'Naruto', 'Gon', 'Deku'];

  final IntFunc randInt = Random().nextInt;

  final int randomIndex = randInt(iterable.length + 1);

  print('\nIterable at element[$randomIndex]: ${iterable.elementAt(randomIndex)}\n');

  try {
    // a run-time error is thrown
    // heroNamesTest[3] = 'Almight';
  } catch (errorMessage, stackTrace) {
    print('\nError Message: $errorMessage\n');
  } finally {
    print('\nSome anime charaters $heroNamesTest\n');
  }
}
