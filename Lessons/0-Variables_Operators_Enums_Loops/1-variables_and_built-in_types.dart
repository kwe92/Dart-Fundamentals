// ignore_for_file: unused_local_variable

void main() {
  const num x = 3;

  final int y = 2;

  int numFightingStyles = 6;

  double pie = 3.14;

  String fighter = 'Baki';

  var spiritAnimal = 'Stich';

  bool isGrappler = true;

  const isAdmin = false;

  final arr0 = <String>['added value'];

  Set set0 = {0, 1, 2, 3, 4};

  const Map<String, Set<dynamic>> hashMap0 = {
    '9999': {'9999-legoVariant-1', '9999-legoVariant-2'},
    '4567': {'4567-legoVariant-1', '4567-legoVariant-2'},
    '4242': {'4242-legoVariant-1', '4242-legoVariant-2', '4242-legoVariant-3'},
  };

  final (String, String, String) personRecord0 = ('Toya', 'Todoroki', 'risingfromtheashes@myhero.io');

  final fighterRunes = fighter.runes;

  final Runes fighterRunes2 = Runes(fighter);

  print('Decoding UTF-16 characters of the string: $fighter: returning the UTF-16 unicode code points: $fighterRunes');

  print('Encoding UTF-16 code points: $fighterRunes2: returning string: ${String.fromCharCodes(fighterRunes2)}');

  // not only can you reassign the value that the variabled references but the type of value can change as well
  dynamic completelyReassignableVariable = 'I am a string!';

  print('using String operations on a dynamic variable: ${completelyReassignableVariable.contains('a')}');

  completelyReassignableVariable = 42;

  print('using integer operations on a dynamic variable: ${completelyReassignableVariable.toDouble()}');
}

// TODO: Refactor Comments

// Variables

//   - References an Object (instance of a Type) in memory with the Objects associated value

//   - most mordern laguages have a way to track what Object a reference (variable) points to
//     by the referenced objects hash code or memory address

/*

Types

  - a set of values along with the operations that can be performed on those values

  - types are characterized by the operations that can be performed on them
    rather than their underlying storage mechanisms

  - objects are instances of types

  - there are built in types and user defined types

Type Annotation

  - 

Dart language: Built-in Types

  - Number | immutable 

    ~ int

    ~ double

  - String | immutable 

  - Boolean | immutable 

  - List | default mutable | immutable option

  - Set | default mutable | immutable option

  - Map | default mutable | immutable option

  - Record | immutable

  - Rune | 

  - Symbol | 

  - dynamic | 

Numbers

  - Numeric literals:

      - int:

          - Set of integers Z
          - {..., -3, -2, -1, 0, 1, 2, 3, ...}

      - double:

          - Set of rational numbers Q: fractional form required
          - {..., -3.21, -2.0, -0.45, 0.0, 1.0, 2.42, 3.5, ...}


Strings

    - immutable sequence of characters

    - A Dart string is a sequence of UTF-16 code units. 

Boolean

  - true and false values (truth values).

*/

// Type Declarations Without Keywords

//   - Specifiying a type declaration without a keyword
//     creates a reassignable reference (variable) of that type

//   - it is a compile-time error to try to assign a different type

// dynamic Type Declaration

//   - a reassignable variable whose value can be of any type

//   - the type of the value can change at compile-time without error

//   - has no operations at compile-time

//   - can use any arbitrary operation at compile-time, but at run-time
//     if the variable does not refer to a value of the correct type then an error is thrown

// var keyword

//   - mutable (reassignable) variable (reference)

//   - can be initalized to any type and remains that type at runtime


// final and const keywords:

//   final

//     - immutable (unreassignabe) variable (reference) 

//     - does not have to be initialized with a value upon declaration

//     - but can only be initialized once and then becomes unreassignabe

//     - it is a compile-time error to try to use a final variable that has not been initialized
//       unless it is prefixed with the late keyword

//     - unlike the const keyword the referenced value in memory will still be mutable if
//       it has mutating oerations

//   const

//     - compile-time constant frozen at compile-time (mutable values referenced become immutable)

//     - immutable (unreassignabe) variable (reference)

//     - static checking for unreassignable references and associated values

//     - must be initialized upon declaration

// String interpolation

//  - Insert variables (references) into strings

//  - use $variableName syntax to format a single variable into a string literal.

//  - Use ${} when you are specifiying more than one variable or using dot notation.