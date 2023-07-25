// TODO: add more Named Constructors

// List

//   - An indexable collection of objects witha length
//   - 0-based indexed array
//   - index has a one-to-one correspondence with Whole numbers {0, 1, 2, 3,...}
//   - if type is omitted non-homogeneous by default i.e. <dynamic>[]
//   - List literals <E>[] can be declared as Iterable

// Most Common List Implementations (sub-classes)

//   Fixed-length List

//     - The length is determined at compile-time and can not be changed
//     - operations attempting to change the length by adding or removing elements will throw an error
//     - you can modify the elements of a fixedlength List

//   Growable List

//     - the default implementation of a List literal <E>[]
//     - an internal buffer is kept and grows as the list grows
//     - allowing for amortized constant time operations

// Constructing a List

//   - the List class is abstract; can not be instantiated directly
//   - you must construct a List one of two ways:

//       - use a List literal:

//           - omit parameterized type: [] -> <dynamic>[] -> non-homogeneous List
//           - include parameterized type: <type>[] -> homogeneous List of specified type

//       - use one of many Named (identity) Constructors

// ignore_for_file: unused_local_variable

//            - there are quite a few factory constructors you can use
//              they will be initalized in the main function below
import '../../utility/spacedPrint.dart';

void main() {
  // Non-homogeneous List Literal growable | modifiable / mutable
  final List<dynamic> multiTypeArr = ['Garra', 14, 42.45];

  multiTypeArr.add('Sand Ninja');

  spacedPrint(multiTypeArr, prefix_space: true);

  multiTypeArr.add(0);

  multiTypeArr[4] = ['One-Tailed Sand Demon', 'Sand Coffin'];

  spacedPrint(multiTypeArr);

  // Homogeneous List Literal | growable | modifiable / mutable
  final singleTypeArr = <int>[0, 1, 2, 3, 4, 5];

  // singleTypeArr.add(''); code fails at compile time as you can not add a String to a List of integers

  // List Named (Identity Constructors)

  //List.filled | default fixed-length | modifiable / mutable
  final fixedArr0 = List<dynamic>.filled(5, 0);

  spacedPrint(fixedArr0);

  fixedArr0[0] = 'Modified element';

  spacedPrint(fixedArr0);

  try {
    // will result in a run-time error
    fixedArr0.add('I can not be added');
  } catch (error, stackTrace) {
    spacedPrint('Error: $error');
  } finally {}
}
