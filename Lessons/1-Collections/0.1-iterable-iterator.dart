// Accessing Elements of an Iterable Object

//   - Iterable objects can not utilize bracket notation
//     i.e. O(1) constant time element access (worst-case asymptotic time complexity)
//   - elements of an Interable object are accessed linearly O(n)

// Iterable.iterator

//   - read-only computed variable (immutable getter variable)
//   - getter is a derivation process;
//     in this case returning an Iterator object
//     as a derivative of the current Iterable
//   - the returned Iterator object allows the steping
//     through of elements within the Iterable
//     from which it was derived in Order-of(n) linear-time
//   - returns a new Iterator object when called

// Iterator.moveNext

//   - a predicate method (boolean function) of an Iterator object
//   - if the predicate is evaluated to be true
//   - the Iterator object is moved forward in the iteration
//     i.e. sequence of current values "elements"
//   - can be passed into a while loop and will be called
//     continuously until the sequence is exhausted (moveNext returns false)

// How Iterable Instance Member Access Elements

//   - ALL members of an Iterable object
//     access the elements in Order-of(n) linear time
//   - this is why we have different implementations (WE WANNA GO FAST! Order-of(1) asymptotic time complexity)

// for-in-loop control flow statement

//   - control flow statements use the iterator getter behind the scenes

import '../../utility/spacedPrint.dart';

void main() {
  // homogeneous Iterable of Strings

  final Iterable heros = <String>['Vegeta', 'Bakugo', 'Gaara'];

  // assgin Iterator to a variable

  final Iterator herosIterator = heros.iterator;

//----------Iterating with: while loop----------//

// loop through Iterator until exhausted (moveNext returns false)
  print('\n');
  while (herosIterator.moveNext()) {
    spacedPrint(
      'Has next element: ${true}',
    );
    spacedPrint(
      'Next Iterator value: ${herosIterator.current}',
    );
  }

  //----------Iterating with: for-in-loop----------//

  for (String hero in heros) {
    spacedPrint(
      hero.toUpperCase(),
    );
  }
}
