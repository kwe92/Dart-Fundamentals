// Collection Implementation

//   - ALL collections in Dart are implemented as parameterized types (Generics)

//   - as such you are able to use any type as an element of a collection

//   - e.g. Lists in Dart are implemented as such:
//       - abstract class List<E> implements ... {
//                                                ...
//                                               }

// Collection literals

//   - explicitly define an elements type within a collection
//   - will through a compile-time error if you do not
//     supply the correct parameterized type defined

void main() {
  // homogeneous Array of integers
  final arrLiteral = <int>[1, 2, 3, 4, 5];

  // homogeneous Set of unique strings
  final setLiteral = <String>{'i', 'am', 'a', 'set'};

// a hash map expecting:
//   - String for keys and Objects for values
  final mapLiteral = <String, Object>{'StringKey': 'I can be any value'};

  final collectionOfLiterals = [
    arrLiteral,
    setLiteral,
    mapLiteral,
  ];

  print('\n');
  collectionOfLiterals.forEach((element) => print('$element\n'));
}
