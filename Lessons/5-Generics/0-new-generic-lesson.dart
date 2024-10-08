// ignore_for_file: unused_catch_stack

import 'dart:math';

void main() {
  final intArr = randIntArr(6, 1, 11);

  print('intArr: $intArr');

  final transformedArr = transformNumber<int, double>(
    intArr,
    (num) => pow(num, 2).toDouble(),
  ).toList();

  print('transformedArr ${transformedArr}');
}

List<E> transformNumber<T extends num, E extends num>(List<T> arr, E Function(T num) f) => <E>[
      for (var x in arr) f(x),
    ];

List<int> randIntArr(int length, int min, int max) => [
      for (var i = 0; i < length; i++) Random().nextInt(max - min) + min,
    ];



// Type Theory: Parameterized Types - Generics

//  - defines a family of related types that can share a single interface and implementation

// Why Use Generics?

//  - retain tooling (complie-time type safety)

//  - classes and functions can work with multiple types with one implementation

//  - Reduce code duplication

//  - Helps write type safe code instead of evaluating expressions at runtime

// Type Arguments

//   - Purpose: Used to specify the types of data that a generic type will work with

//   - Where they appear: Inside angle brackets (<>) after a generic type name

// Type Annotations

//   - Purpose: Used to explicitly declare the type of a variable, parameter, or return value statically

//   - Where they appear: in Dart before a variable, parameter, or function name

// Using collection literals
 
//   - collections are Generic by default

//   - you can use Parameterized literals by prefixing the literal with <type> (for Lists and Sets)
//     or <keyType, valueType> for Maps

// Using Parameterized Types With Constructors and Functions

//  - replace place holder (stand-in) types explicitly during instantiation or invocation

//   - put one or more types between angle brackets (<...>) directly after the class or function name


// Generic collections and the types they contain

//  - generic types are reified in dart, retaining their type information
//    during runtime e.g. a parameterized list literal of <int>[]
//    will be a List<int> at runtime instead of a just a List like in Java
//    which uses erasure instead of reified

// Restricting the Parameterized Type

//   - the default subtype of placeholder types is Object? (any nullable Object)

//   - to restrict the set of types you can use with a Generic 
//     the extends keyword is used follow by the required subtype that a type argument must be a subtype of

// Using Generic Methods

//   - generic type parameters of a function allow you to use the place holder type arguments in several places:

//       - in the functions return type

//       - in the type of a argument and any types of a argument that accept a generic expression 
//         that accepts a type argument of the specified parameterized type

//       - in the type of a local variable

// Using Generic Classes

//   - generic type parameters of a class allow you to use the place holder type arguments
//     anywhere a type annotation or type argument can be used within a class