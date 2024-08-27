// ignore_for_file: unused_local_variable

void main() {
// Specifiying a type without a keyword creates a mutable variable of that type. it is a compile-time error to try to assign a different type

  String fighter = 'Baki';

  int numFightingStyles = 6;

  double pie = 3.14;

  bool grappler = true;

  // var keyword

  //   - mutable variable

  //   - can be initalized to any type and remains that type at runtime

  var spiritAnimal = 'Stich';

  // final and const keywords:

  //   final

  //     - immutable variables that can only be set once and then becomes frozen
  //        at compile time

  //   const

  //     - compile-time constant frozen at compile-time

  final int x = 2;

  const int y = 3;

// String interpolation

//  - Insert variables into strings

//  - use $variableName syntax to format a single variable into a string literal.

//  - Use ${} when you are specifiying more than one variable or using dot notation.

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

  - true and false values.

*/
