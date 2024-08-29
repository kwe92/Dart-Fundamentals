// ignore_for_file: unused_local_variable

void main() {
  String fighter = 'Baki';

  int numFightingStyles = 6;

  double pie = 3.14;

  bool grappler = true;

  var spiritAnimal = 'Stich';

  final int x = 2;

  const int y = 3;

  dynamic changingVariable = 'I am a string!';

  print('using String operations on a dynamic variable: ${changingVariable.contains('a')}');

  changingVariable = 42;

  print('using integer operations on a dynamic variable: ${changingVariable.toDouble()}');

  print("$fighter is a fighter with $numFightingStyles fighting styles.");

  print(spiritAnimal);

  spiritAnimal = "Ifrit";

  print(spiritAnimal);
}


/*

Types

  - a set of values along with the operations that can be performed on those values

  - an object is an instance of a type and a type is characterized
    by the operations that you can perform on it rather than its underlying storage mechanism

  - there are built in types and user defined types

Dart language: Built-in Types

  - Number
  - String
  - Boolean
  - List
  - Set
  - Map
  - Record
  - Rune
  - Symbol
  - dynamic

Numbers

  - Numeric literals:

      - int:

          - Set of integers Z
          - {..., -3, -2, -1, 0, 1, 2, 3, ...}

      - double:

          - Set of rational numbers Q: fractional form required
          - {..., -3.21, -2.0, -0.45, 0.0, 1.0, 2.42, 3.5, ...}


Strings

    - sequence of characters

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

//     - but can only be initialized once and then becomes frozen at compile time

//     - it is a compile-time error to try to use a final variable that has not been initialized
//       unless it is prefixed with the late keyword

//   const

//     - compile-time constant frozen at compile-time

//     - immutable (unreassignabe) variable (reference)

//     - static checking for unreassignable references

//     - must be initialized upon declaration

// String interpolation

//  - Insert variables (references) into strings

//  - use $variableName syntax to format a single variable into a string literal.

//  - Use ${} when you are specifiying more than one variable or using dot notation.