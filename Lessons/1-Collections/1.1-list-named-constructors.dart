// ignore_for_file: unused_catch_stack

import '../../utility/spacedPrint.dart';

// Constructing a List: Named Constructors

//   - named "identity" constructors offer an alternative way to instantiate a List
//   - most named constructors are Factory Constructors
//     Factory Constructors offer more complex logic
//     when defining their implementation as they can have a code block
//   - however named constructors can also be Initializer Lists
//     for simpler implementations that do not need access to the this keyword
//     or that do not require complex logic (code blocks)

// defining the shape of a dynamic predicate function
//   - (a statement that is true or false given some agrument "variable")
typedef DynamicPredicateCallback = bool Function(dynamic ele);

void main() {
  // List Named "Identity" Constructors

  // List.filled

  //   - default fixed-length
  //   - length can not be changed at compile-time
  //   -  modifiable / mutable elements
  //        - references "pointers in memory" of values within can be changed
  //   - only immutable by length, not by deep copy

  // parameterized function expression to keep code D.R.Y
  final prefixedSpacePrint = <T>(T obj) => spacedPrint(obj, prefix_space: true);

  final fixedArr0 = List<dynamic>.filled(5, 0);

  try {
    // modifying the length of a fixed-length List will result in a run-time error

    fixedArr0.add('I can not be added.');
  } catch (error, stackTrace) {
    prefixedSpacePrint('Error: $error');
  } finally {
    // references "pointers" can be accessed to modify the elements "objects" that are being held at that point in memory

    spacedPrint(fixedArr0);

    fixedArr0[0] = 'Modified element';

    prefixedSpacePrint(fixedArr0);
  }

  //------------------------------------------//

  // List.castFrom

  //   - adapts the source List <S>[...] into a parameterized type <T>[...]
  //   - the data-type of the elements within <S>[...]
  //     must be a sub-type of the elements within <T>[...] or an error is thrown

  // Example: Casting an Array of doubles into an Array of num

  //   - double is a sub-type of num in the Dart-type heirarchy

  final decimalArr = <double>[3.14, 0.1, 0.01, 0.001];

  final List<num> castAsNumArr = List.castFrom<double, num>(decimalArr);

  prefixedSpacePrint(castAsNumArr);

  //------------------------------------------//

  // List.empty

  // - fixed-length by default
  // - can be changed to growable with the growable boolean property
  // - creates an empty List of length 0

  final emptyArr = List.empty(growable: false);

  try {
    // emptyArr.add('I can not be added and will throw a run-time error.'); //Unsupported operation: Cannot modify an unmodifiable list
    emptyArr[0] = 'I can not be added and will throw a run-time error.';
  } catch (error, stackTrace) {
    prefixedSpacePrint('Error: $error');
  }

  prefixedSpacePrint('Empty array: $emptyArr');

  //-------------------------------------------------------------------//

  // List.from

  //   - takes an Iterable as an argument and converts it to a List
  //   - can be used to down-cast a List

  final DynamicPredicateCallback isFavoriteCharater = (dynamic name) => name == 'Rock Lee';

  final Iterable strIter = <String>{'Gaara', 'Neji', 'Rock Lee'};

  final favorite_character0 = List<String>.from(strIter).where(
    (String name) => name == 'Gaara',
  );

  final favorite_character1 = strIter.toList().where(
        isFavoriteCharater,
      );

  prefixedSpacePrint(favorite_character0);

  spacedPrint(favorite_character1);

//------------------------------------------//

// List.of

//   - can convert any sub-type of Iterable to a List
//   - What the .toList method uses under the hood for Iterables

  final Iterable iter0 = <int>{42, 11, 9999};

  final Iterable heroArray0 = <String>['Garra', 'Killua', 'Shikimaru'];

  final Set set0 = <double>{42, 3.14, 0.00001};

  final List<Iterable> iterArray = [iter0, heroArray0, set0];

  final List<List> listArray = [for (Iterable iter in iterArray) List.of(iter)];

  spacedPrint('listArray $listArray');

  for (final Iterable iter in listArray) {
    spacedPrint(iter.runtimeType);
  }

//------------------------------------------//

// List.unmodifiable

//   - converts any sub-type of Iterable into
//     a completely "deeply" immuable List
//   - the length and the referenced elements can not be changed

  final List<List<dynamic>> immutableLists = [for (final Iterable iter in listArray) List.unmodifiable(iter)];

  spacedPrint('immutableLists: ${immutableLists[0]}');
  try {
    // will throw at run-time
    immutableLists[0][0] = 9999;
  } catch (error, stackTrace) {
    spacedPrint(error);
  } finally {}

//------------------------------------------//

// List.writeIterable

//   - sets all elements from a source Iterable and sequentially
//     adds the elements to a List starting at a specified index of the target
//   - The target List must:
//       - not be empty
//       - must have a length at least as long as the number of elements being added
//         if using at greater than 0
//       - must be modifiable at least at the element reference level
//        (pointers of contained objects can have their value changed)

  final Iterable<dynamic> sourceIterable = [
    'Gaara',
    'Sand Ninja',
    43.75,
    ['Sand Coffin', 'Sand Armor', 'One-Tailed Sand Demon']
  ];

  final List<dynamic> targetList = List.filled(sourceIterable.length + 1, 9999, growable: true);

  List.writeIterable(targetList, 0, sourceIterable);

  spacedPrint('Target List of List.writeIterable: $targetList');

// List.copyRange

//   - Copys a range of elements from one List into another
//   - the target List has the same requirements of a target
//     List when passing the target to List.writeIterable
//   - the differences between List.withIterable and List.copyRange:
//       - List.copyWith source must be a List
//       - the source being a List adds granularity as the source
//         can be explicitly indexed with a start and end range
//         where as Iterables can only be access sequentially (linearly Order-of(n) or Big-O-of(n))

  List.copyRange(targetList, 0, sourceIterable.toList(), 1);

  spacedPrint('Target List of List.copyRange: $targetList');

//------------------------------------------//

// List.switch ??

// /

//------------------------------------------//
}
