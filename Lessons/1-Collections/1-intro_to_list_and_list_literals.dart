import '../../utility/spacedPrint.dart';

// ignore_for_file: unused_local_variable

void main() {
  // heterogeneous List Literal growable | modifiable / mutable
  final multiTypeArr = ['Garra', 14, 42.45];

  multiTypeArr.add('Sand Ninja');

  spacedPrint(multiTypeArr, prefix_space: true);

  multiTypeArr.add(0);

  multiTypeArr[4] = ['One-Tailed Sand Demon', 'Sand Coffin'];

  spacedPrint(multiTypeArr);

  // "Homogeneous" List Literal | growable | modifiable / mutable
  final singleTypeArr = <int>[0, 1, 2, 3, 4, 5];
}

// List (Arrays)

//   - An indexable collection of objects with a length

//   - 0-based indexed array

//   - an arrays index has a one-to-one correspondence with the set of Whole numbers {0, 1, 2, 3,...,n}

//   - Lists that are not frozen at compile time can be seen as sequences of mutable cells mapped to indices (just as a pointer is an index to a cell of memory)

//   - if the type argument is omitted the type is inferred to be dynamic
//       - non-homogeneous i.e. <dynamic>[]

//   - List literals <E>[] or [] can be declared as Iterable

// Most Common List Implementations (sub-classes) | Mutable | Imperative Updating

//   Fixed-length List

//     - The length is determined at compile-time and can not be changed (similar to Array's in SML)

//     - operations attempting to change the length by adding or removing elements will throw an error

//     - you can modify the elements "change the values referenced within" of a fixedlength List
//       indicating fixed-length Lists are not frozen at compile-time

//   Growable List

//     - the default implementation of a List literal <E>[]

//     - an internal buffer is kept and grows as the list grows (array doubling / amortized arrays)

//     - allowing for amortized constant time operations O(1)

// Constructing a List

//   - the List class is abstract; can not be instantiated "invoked" directly

//   - you must construct a List one of two ways:

//       - use a List literal:

//           - omit type argument: [] -> <dynamic>[] -> non-homogeneous List
//           - include type argument: <T>[] -> homogeneous List of specified type T

//       - use one of many Named (identity) Constructors

//            - there are quite a few named constructors and static methods to create lists
//              part of the List type interface
