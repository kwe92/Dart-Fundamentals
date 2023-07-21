// Accessing Elements of an Iterable Object

//   - as stated earlier Iterable objects can not utilize
//     bracket notation; O(1) constant time element access (worst-case asymptotic time complexity)
//   - elements of an Interable object are accessed linearly O(n)

// Iterable.iterator

//   - a read-only computed variable (immutable getter variable)
//   - returns an Iterator object derived from the cueent Iterable
//   - allows you to step through the elements of an Iterable in O(n)
//   - returns a new Iterator object when called

// Iterable.moveNext

//   - a predicate method of an Iterable object
//   - moves the Iterator object forward in the iteration (sequence of current values "elements")
//     if returned as true
//   - can be passed into a while loop and will be called
//     until the sequence is exhausted (moveNext returns false)

void spacedPrint<T>(T obj, [bool suffix_space = true]) => suffix_space ? print('\n$obj\n') : print('\n$obj');

void main() {
  // homogeneous Iterable of Strings
  final Iterable heros = <String>['Vegeta', 'Bakugo', 'Gaara'];

  // assgin Iterator to a variable
  final Iterator herosIterator = heros.iterator;

// loop through Iterator until exhausted (moveNext returns false)
  while (herosIterator.moveNext()) {
    spacedPrint('Has next element: ${true}');
    spacedPrint('Next Iterator value: ${herosIterator.current}');
  }
}
