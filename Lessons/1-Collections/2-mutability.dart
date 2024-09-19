void main() {
  // mutable reference if:

  //   - var keyword used

  //   - type specified without keyword

  //   - const is omitted

  // Mutable object if:

  //   - the instantiated type (created object) is mutable (has mutator operations as part of its interface)

  //   - the const keyword is not used during variable declaration
  //
  //   -  the collection is not created with SomeCollectionType.unmodifiable (alternate named constructor for collections to make them immutable)

  final List<String> heroNames = [
    'Goku',
    'Naruto',
    'Gon',
    'Deku',
  ];

  print("initial List elements: $heroNames");

  // add value to end of array (mutator operation)
  heroNames.add('Vegeta');

  // insert element at specified index, (mutator operation)
  // shifting ALL elements O(n) linear time complexity
  heroNames.insert(0, 'Almight');

  print("List elements after adding two values with add and insert methods: $heroNames");

  // removes an element at a specified index location ( O(n) or O(1)? ) | (mutator operation)
  heroNames.removeAt(2);

  print("List elements after calling removeAt(2) method: $heroNames");

  update<String>(heroNames, 3, "Gaara");

  print("List elements after calling update function with side effects: $heroNames");

  // removes all elements from a growable List | (mutator operation)
  heroNames.clear();
  print(heroNames);

  print("List elements after ccalling clear method: $heroNames");

  update<String>(heroNames, 9999, "Cell");
}

/// side effect: set the ith element of [arr] to [value]
///
/// throw error if [i] is not a legal subscript into [arr]
void update<T>(List<T> arr, int i, T value) {
  try {
    arr[i] = value;
  } catch (e) {
    print("error in update: ${e.toString()}");
  }
}

// Functions With Side Effects (impure function)

//   - mutates a value outside of its lexical scope

//   - can be non-deterministic in nature

//   - RARELY RECOMENDED

//   - it is better to make a copy of the underlying mutable object

//       - e.g. useing the spread operation to copy an array: final arrayCopy = [...arrayIwantToCopy];
