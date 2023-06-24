import 'dart:math';

// Iterables

//   - data structure, representing a collection of elements
//   - can be accessed sequentially
//   - abstract class (can not instantiate)
//   - cant be index by brackets

const Iterable<double> iterable = [3.14, 0.001, 0.05];

// iterable[9]; // will throw a compile error

// Iterable.elementAt

//   - O(n) linear time complexity

typedef IntFunc = int Function(int);

void main() {
  final IntFunc randInt = Random().nextInt;

  final int randomIndex = randInt(iterable.length + 1);

  print('\nIterable at element[$randomIndex]: ${iterable.elementAt(randomIndex)}\n');
}
