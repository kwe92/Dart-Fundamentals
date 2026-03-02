// ignore_for_file: unused_local_variable

//   - we are ignoring the unused_local_variable warning because
//     we do not need to use all variables in this example

void main() {
  // type is inferred to be int
  const x = 3;
  const xx = 5;

  // type is inferred to be double
  final y = 2.0;

  // type annotation is explicitly num
  const num someNumber = 5.32131231;

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

  const Symbol mySymbolName = Symbol('The_Symbol_of_Humanity');

  // not only can you reassign the value that iCanChangeIntoAnyType references due to ommiting the const and final keywords
  // but the type of value can change durring runtime as well

  dynamic iCanChangeIntoAnyType = 'I am a string!';

  print('using String operations on a dynamic variable: ${iCanChangeIntoAnyType.contains('a')}');

  iCanChangeIntoAnyType = 42;

  print('using integer operations on a dynamic variable: ${iCanChangeIntoAnyType.toDouble()}');

  final noTypeAnnotation; // defaults to dynamic

  noTypeAnnotation = 42.42; // daynamic variable initialzed with an double

  print('noTypeAnnotation has no known operations or methods of double until runtime: ${noTypeAnnotation.round()}');

  print('noTypeAnnotation runtime type: ${noTypeAnnotation.runtimeType}');
}

// TODO: Add notes on the idomatic way to use keywords and type annotations

// Variables

//   - references an Object (instance of a Type) in memory with the Objects associated value

//   - most mordern laguages have a way to track what Object a reference (variable) points to
//     by the referenced objects hash code or memory address

/*

Types

  - a set of values along with the operations that can be performed on those values

  - types are characterized by the operations that can be performed on them
    rather than their underlying storage mechanisms

  - objects are instances of types

  - there are built in types and user defined types

Type Inferrence

  - when you ommit the type annotation during variable declaration
    then the type is inferred based on what is initalized

  - if there is no inital value upon variable declaration then the type
    is inferred to be 'dynamic'

Type Annotation

  - setting the static type of a variable at compile-time

Dart language: Built-in Types

  - Number | immutable

    ~ int

    ~ double

  - String | immutable

  - Boolean | immutable

  - List | collection | default mutable | has immutable option

  - Set | collection | default mutable | has immutable option

  - Map | collection | default mutable | has immutable option

  - Record | collection | immutable

  - Rune | immutable

  - Symbol | immutable

  - dynamic | mutable

Numbers

  - Numeric literals:

      ~ int:

          - Set of integers Z

          - {..., -3, -2, -1, 0, 1, 2, 3, ...}

      ~ double:

          - Set of rational numbers Q: fractional form required

          - {..., -3.21, -2.0, -0.45, 0.0, 1.0, 2.42, 3.5, ...}


Strings

    - immutable sequence of characters

    - Dart strings are sequences of UTF-16 code units

Boolean

  - the truth values: true and false

*/

// Type Declarations Without Keywords

//   - Specifiying a type declaration without a keyword and instead using a type annotation
//     creates a reassignable reference (variable) of that type

//   - it is a compile-time error to try to assign an object of a different type

// dynamic Type Declaration

//   - a reassignable variable whose value can be of any type

//   - the type of the value can change at compile-time without error if const and final are omitted

//   - has no operations at compile-time and the operations used are evlauated at run-time
//     if the variable does not reference an object with the correct interface then an error is thrown

// var keyword

//   - created a mutable (reassignable) variable (reference)
//     whose type is infered and remains that type at compile-time

//   - similar to using a Type Annotation without the keywords const or final
//     with type inferrence


// final and const keywords:

//   final

//     - immutable (unreassignabe) variable (reference) 

//     - does not have to be initialized with a value upon declaration

//     - but can only be initialized once and then becomes unreassignabe

//     - it is a compile-time error to try to use a final variable that has not been initialized
//       unless it is prefixed with the late keyword

//     - unlike the const keyword the reference value in memory will still be mutable if
//       it has mutating oerations

//   const

//     - compile-time constant frozen at compile-time (mutable values referenced become immutable)

//     - immutable (unreassignabe) variable (reference)

//     - static checking for unreassignable references and associated values

//     - must be initialized upon declaration

//         ~ e.g. const List<List<int>> myListOfLists = [[0, 1, 2], [3, 4, 5]];

//         ~ all of the collections in this case Arrays become unmodifiable (immutable) at compile-time, effectively frozen



// String interpolation

//  - Insert variables (references) into strings

//  - use $variableName syntax to format a single variable into a string literal

//  - Use ${} when you are:

//   ~ specifiying more than one variable

//   ~ using dot notation to access properties or methods

//   ~ evaluating some expression

//     - e.g. print('The sum of $x + $y = ${x + y}');