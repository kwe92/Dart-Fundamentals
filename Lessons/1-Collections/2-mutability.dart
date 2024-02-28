void main() {
  // mutable if:

  //   - var keyword used
  //   - final keyword used
  //   - parameterized type specified
  //   - const is omitted

  final List<String> heroNames = [
    'Goku',
    'Naruto',
    'Gon',
    'Deku',
  ];

  print("initial List elements: $heroNames");

  // add value to end of array
  heroNames.add('Vegeta');

  // insert element at specified index,
  // shifting ALL elements O(n) linear time complexity
  heroNames.insert(0, 'Almight');

  print("List elements after adding two values with add and insert methods: $heroNames");

  // removes an element at a specified index location ( O(n) or O(1)? )
  heroNames.removeAt(2);

  print("List elements after calling removeAt(2) method: $heroNames");

  update<String>(heroNames, 3, "Gaara");

  print("List elements after calling update function with side effects: $heroNames");

  // removes all elements from a growable List
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
