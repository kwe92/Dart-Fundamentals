void main() {
  final List<String> heroNames = [
    'Goku',
    'Naruto',
    'Gon',
    'Deku',
  ];

  print("initial List elements: $heroNames");

  // add value to end of array | (mutator operation)
  heroNames.add('Vegeta');

  // insert element at specified index | (mutator operation)
  // shifting ALL elements O(n) linear time complexity
  heroNames.insert(0, 'Almight');

  print("List elements after adding two values with add and insert methods: $heroNames");

  // removes an element at a specified index location | (mutator operation)
  heroNames.removeAt(2);

  print("List elements after calling removeAt(2) method: $heroNames");

  print('heroNames hash code: ${heroNames.hashCode}');

  update<String>(heroNames, 3, "Gaara");

  print("List elements after calling update function with side effects: $heroNames");

  // defensive copies insure that the referenced collection is not modified unintentionally
  update<String>([...heroNames], 4, "Bakugo");

  print("List elements after calling update function with defensive copy: $heroNames");

  // removes all elements from a growable List | (mutator operation)
  heroNames.clear();

  print(heroNames);

  print("List elements after calling clear method: $heroNames");

  update<String>(heroNames, 9999, "Cell");
}

/// a generic function that sets the ith element of [arr] to [value].
///
/// throw error if [i] is not a legal subscript into [arr].
void update<T>(List<T> arr, int i, T value) {
  // Note: the update function has SIDE EFFECTS!
  //       directly mutating the array passed in.
  try {
    print('hash code of arr to be modified by the update function: ${arr.hashCode}');

    // direct mutation of array passed in
    arr[i] = value;
  } catch (e) {
    print("error in update: ${e.toString()}");
  }
}

// TODO: Refactor comments and move them around to other modules if needed

// mutable reference if:

//   - var keyword used

//   - type specified without keywords const or final

// Mutable Collection if:

//   - the instantiated type (created object) is mutable (has mutator operations as part of its interface)

//   - the const keyword is not used during variable declaration (implicitly omiting unmodifiable)

//   -  the collection is not created with SomeCollectionType.unmodifiable (alternate named constructor for collections to make them immutable / unmodifiable)

// Functions With Side Effects (impure function)

//   - mutates a value outside of its lexical scope

//   - can be non-deterministic in nature

//   - typically returns void

//   - RARELY RECOMENDED

//  What to Do Instead of Mutating Collections or Returning Mutable Objects

//   - it is better to make a copy of the underlying mutable collection
//     either inside the implementation of the function or
//     pass a defensive copy of the mutable collection

//   - e.g. of copy / defensive copy of an array using the spread operation:

//       - final arrayCopy = [...arrayIwantToCopy];

//       - return copies of any mutable object that a function mutates

//   - you can also pass an immutable (unmodifiable) collection
//     but ensure you handle errors properly

// Issues With Defensive Copies

//   - you have copies of the same data throughout memory
//     taking up more space

//   - it takes time to copy large or complex objects

//   - so you increase both time complexity and space complexity

//   - it is better to use immutable objects where possible to have
//     the ability to safely share the same value in memory

