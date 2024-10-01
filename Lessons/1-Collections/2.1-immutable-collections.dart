void main() {
  // Example 1: Array Declared With const

  const arr0 = [
    [0, 1, 2, 3],
  ];

  // assign immutable collection to a new reference
  var arr2 = arr0[0];

  try {
    // attempt to modify an immutable collection, throwing an error
    arr2.add(4);

    print(arr2);
  } catch (err, _) {
    print(err.toString());
  }

  // Example 2: Array Created With List.unmodifiable Factory Method

  var arr1 = List<List<int>>.unmodifiable([
    List<int>.unmodifiable([0, 1, 2, 3]),
  ]);

  var arr3 = arr1[0];

  try {
    arr3.add(4);

    print(arr3);
  } catch (err, _) {
    print(err.toString());
  }
}

// Immutable Collections

//   - the collection itself is immutable and all its elements are also immutable
//     when accessed or reassigned to a new reference

//   - it is a compile time error to call mutating operations on immutable (unmodifiable) collections

//   - there are two ways to make a collection immutable:

//       - declare the reference to be constant (prefix variable declaration with the const keyword)
//         among many other things the const keyword can be viewed as implicitly wrapping
//         the initialized collection along with all of its elements that are subtypes of Iterable with the unmodifiable method

//       - use the unmodifiable named constructor associated with the collection you wish to instantiate (create)
