// ignore_for_file: unused_catch_stack

import '../../utility/spacedPrint.dart';

// Constructing a List: Named Constructors

//   - as stated previously an alternative way to instantiate a List is by way of
//     named "identity" constructors
//   - most named constructors are Factory Constructors
//     allowing for more complex logic when defining their implementation
//   - however named constructors can also be Initalizer Lists
//     for simpler implementations that do not need access to the this keyword

void main() {
  // List Named "Identity" Constructors

  // List.filled

  //   - default fixed-length "length can not be changed at compile-time"
  //   -  modifiable / mutable i.e. references "pointers in memory" can be accessed and their elements changed

  // function expression to keep code D.R.Y
  final prefixedSpacePrint = <T>(T obj) => spacedPrint(obj, prefix_space: true);

  final fixedArr0 = List<dynamic>.filled(5, 0);

  try {
    // modifying the length of a fixed-length List will result in a run-time error

    fixedArr0.add('I can not be added');
  } catch (error, stackTrace) {
    prefixedSpacePrint('Error: $error');
  } finally {
    // references "pointers" can be accessed to modify the elements "objects" that are being held at that point in memory

    spacedPrint(fixedArr0);

    fixedArr0[0] = 'Modified element';

    prefixedSpacePrint(fixedArr0);
  }

  // List.castFrom

  //   - adapts the source List <S>[...] into a parameterized type <T>[...]
  //   - the source type "data-type of elements" within <S>[...]
  //     must be a sub-type of <T>[...] or an error is thrown

  // e.g. Casting an Array of doubles into an Array of num
  // as double is a subtype of num in the type heirarchy

  final decimalArr = <double>[3.14, 0.1, 0.01, 0.001];

  final List<num> castAsNumArr = List.castFrom<double, num>(decimalArr);

  prefixedSpacePrint(castAsNumArr);

  // List.empty

  // - fixed-length by default
  // - creates an empty List of length 0

  final emptyArr = List.empty(growable: false);

  try {
    emptyArr[0] = 'I can not be added and will throw a run-time error.';
  } catch (error, stackTrace) {
    prefixedSpacePrint('Error: $error');
  }

  prefixedSpacePrint('Empty array: $emptyArr');

  // List.from

  // List.from(elements)
}
