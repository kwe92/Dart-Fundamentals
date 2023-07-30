// ignore_for_file: unused_catch_stack

import '../../utility/spacedPrint.dart';

// Constructing a List: Named Constructors

//   - as stated previously an alternative way to instantiate a List is by way of
//     named "identity" constructors
//   - most named constructors are Factory Constructors
//     allowing for more complex logic when defining their implementation
//   - however named constructors can also be Initializer Lists
//     for simpler implementations that do not need access to the this keyword
//     or that do not require complex logic (Initializer Lists CAN NOT have a code block)

// defining the shape of a dynamic predicate function (a function that only returns true or false given some agrument)
typedef DynamicPredicateCallback = bool Function(dynamic ele);

void main() {
  // List Named "Identity" Constructors

  // List.filled

  //   - default fixed-length "length can not be changed at compile-time"
  //   -  modifiable / mutable elements
  //        - references "pointers in memory" of values within
  //          a fixed-length List can be accessed and their elements changed
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
  //   - the source type "data-type of the elements" within <S>[...]
  //     must be a sub-type of <T>[...] or an error is thrown

  // Example: Casting an Array of doubles into an Array of num

  //   - double is a sub-type of num in the Dart-type heirarchy

  final decimalArr = <double>[3.14, 0.1, 0.01, 0.001];

  final List<num> castAsNumArr = List.castFrom<double, num>(decimalArr);

  prefixedSpacePrint(castAsNumArr);

  //------------------------------------------//

  // List.empty

  // - fixed-length by default; can be changed with the growable property
  // - creates an empty List of length 0

  final emptyArr = List.empty(growable: false);

  try {
    emptyArr[0] = 'I can not be added and will throw a run-time error.';
  } catch (error, stackTrace) {
    prefixedSpacePrint('Error: $error');
  }

  prefixedSpacePrint('Empty array: $emptyArr');

  //------------------------------------------//

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

//   - converts any sub-type of Iterable into a completely immuable List
//   - the length and the elements can not be changed, as the name
//     implies the Lists are completely unmodifiable

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

//   - takes the elements starting at a specified index from a List
//     and sequentially adds the elements to an Iterable
//   - The target Iterable must:
//       - not be empty
//       - must have a length at least as long as the elements being added
//       - must be modifiable at least at the element reference level (pointers of contained objects can have their value changed)

  final List<dynamic> sourceList = [
    'Gaara',
    'Sand Ninja',
    43.75,
    ['Sand Coffin', 'Sand Armor', 'One-Tailed Sand Demon']
  ];

  final List<dynamic> targetList = List.filled(sourceList.length, 9999, growable: true);

  List.writeIterable(targetList, 0, sourceList);

  spacedPrint('Target List of writeIterable: $targetList');

// List.copyRange

//   - Copy a range of elements from one list into another

  List.copyRange(targetList, 0, sourceList);

  // spacedPrint('Target List of writeIterable: $targetList');

//------------------------------------------//

// List.switch ??

// /

//------------------------------------------//
}
