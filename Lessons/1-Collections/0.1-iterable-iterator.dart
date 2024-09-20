import '../../utility/spacedPrint.dart';

void main() {
  // homogeneous Iterable of Strings | would work if the static type was a List as well
  final Iterable<String> heros = ['Vegeta', 'Bakugo', 'Gaara'];

  //----------Iterating with: for-in-loop----------//

  for (String hero in heros) {
    spacedPrint('for in loop heros current element: $hero');
  }

  // ----------Iterating with: Iterator Object----------//

  // assgin Iterator to a variable
  final Iterator herosIterator = heros.iterator;

  for (var hasElement = herosIterator.moveNext(), hero = herosIterator.current;
      hasElement;
      hasElement = herosIterator.moveNext(), hero = hasElement ? herosIterator.current : null) {
    spacedPrint('heros Iterator current element: $hero');
  }

  // ----------Iterating with: Iterator Object After Iterator Initialized && Array Mutated---------- //

  List<String> heros2 = heros.toList();

  Iterator herosIterator2 = heros2.iterator;

  try {
    // mutate growable Array by adding an element
    heros2.add('Young Midoriya');

    // try to access the iterator that was initalized before the mutation occured, will throw an error
    for (var hasElement = herosIterator2.moveNext(), hero = herosIterator2.current;
        hasElement;
        hasElement = herosIterator2.moveNext(), hero = hasElement ? herosIterator2.current : null) {
      spacedPrint('heros Iterator2 current element: $hero');
    }
  } catch (err, _) {
    spacedPrint('Error: ' + err.toString());
  }
}

// TODO: refactor comments

// Accessing Elements of an Iterable Object

//   - Iterable objects can not utilize bracket notation
//     i.e. O(1) constant time element access (worst-case asymptotic time complexity)

//   - elements of an Interable object are accessed linearly O(n)

// Iterable.iterator | property | getter computed variable

//   - read-only computed variable (immutable getter variable)

//   - getter is a derivation process;
//     in this case returning an Iterator object
//     as a derivative of the current Iterable (this.Iterable)

//   - the returned Iterator object allows the stepping
//     through of elements within the Iterable
//     from which it was derived in Order-of(n) linear-time

//   - returns a new Iterator object when called

// Iterator.moveNext | abstract method

//   - a predicate method (boolean function) of an Iterator object

//   - if the predicate is evaluated to be true

//   - the Iterator object is moved forward in the iteration
//     i.e. sequence of current values "elements"

//   - Iterator.current holds the current value identified by moveNext until moveNext is called again

//   - Iterator.moveNext can be passed into a while loop and will be called
//     continuously until the sequence is exhausted (moveNext returns false)
//     in which case Iterator.current should not be read

// Iterator.current | property | parameterized getter computed variable

//   - the current element the Iterator is on

//   - initally Null if Iterator.moveNext has not been called first

//   - calling Iterator.current before calling Iterator.moveNext
//     returns true will throw in an error

//   - calling iterator.current after Interator.moveNext
//     has returned false will generate unexpected values or throw

// How Iterable Instance Members Access Elements

//   - ALL members of an Iterable object
//     access the elements in Order-of(n) linear time

//   - this is why we have different implementations (WE WANNA GO FAST! Order-of(1) asymptotic time complexity)

// for-in-loop control flow statement

//   - control flow statements use the iterator getter behind the scenes

//   - if the collection is modified and you choose to use the Iterator object instead of a
//     for in loop an error will be thrown saying you modified the array during iteration