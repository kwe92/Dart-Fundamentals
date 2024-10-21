void main() {
  // homogeneous Array of integers
  final arr = <int>[1, 2, 3, 4, 5];

  // homogeneous Set of unique strings
  final set = <String>{'i', 'am', 'a', 'set'};

// a hash map expecting:

//   - Strings for keys and Objects (non-nullable) for values
  final mapLiteral = <String, Object>{
    'key_1': 'I can be any non-nullable value',
    'key_2': arr,
    'key_3': set,
  };

  final collectionOfCollections = <Object>[
    arr,
    set,
    mapLiteral,
  ];

  collectionOfCollections.forEach((collection) => print('$collection\n'));
}

// Collection Implementation

//   - ALL collections in Dart are implemented as parameterized types (Generics)

//   - as such you are able to use any type as an element of a collection

//   - e.g. Lists in Dart are implemented as:

//      - abstract class List<E> implements ... {
//                                                ...
//                                               }

// Generic Collection literals

//   - can explicitly define the type of elements a collection will contain
//     by passing a type argument to the parameterized type between angle brackets

//   - explicit type arguments ensure compile-time type safety
//     preventing the insertion of incompatible elements into a collection

//   - If you attempt to add an element of the wrong type, the compiler will throw an error