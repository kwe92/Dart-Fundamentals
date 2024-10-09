// ignore_for_file: unused_catch_stack

import 'dart:math';

void main() {
  final intArr = randIntArr(6, 1, 11);

  print('intArr: $intArr');

  final transformedArr = transformNumber<int, double>(
    intArr,
    (num) => double.parse(
      (pow(num, 2) / intArr.length).toStringAsFixed(2),
    ),
  ).toList();

  print('transformedArr ${transformedArr}');
}

// given a function f transform an Iterable T of numbers into an Iterable E of numbers
// bounded by the num Type
Iterable<E> transformNumber<T extends num, E extends num>(Iterable<T> arr, E Function(T num) f) => <E>[
      for (var x in arr) f(x),
    ];

List<int> randIntArr(int length, int min, int max) => [
      for (var i = 0; i < length; i++) Random().nextInt(max - min) + min,
    ];



// Type Theory: Parameterized Types - Generics

//   - Generics are classes, interfaces, or functions / methods that can be used with different types
//     by defining a family of related types that can share a single interface and implementation
//     through the use of type parameters

//   - generic functions can accept and return different data types

// Why Use Generics?

//  - retain tooling (complie-time type safety)

//  - classes and functions can work with multiple types with one implementation

//  - Reduce code duplication by removing the need to write separate versions of the same
//    code to work with different types, keeping code D.R.Y

//  - Helps write type safe code as the compiler enforces static type constraints
//    instead of evaluating expressions at runtime

// Type Parameters

//   - type parameters act as placeholders for type arguments received
//     upon instantiation of a class (through both named and unnamed constructors)
//     or invocation of a function / method

//   - both type parameters and type arguments are placed between angle brackets (<>)

// Type Arguments

//   - purpose: used to specify the types of data that a generic type will work with

//   - where Type Arguments appear: inside angle brackets (<>) after the instantiation 
//                                  of a generic class or invocation of a generic function / method
//                                  typically after the generic type name (class name / function name)

// Using collection literals
 
//   - collections are Generic by default

//   - you can use Parameterized literals by prefixing the literal with <type> (for Lists and Sets)
//     or <keyType, valueType> for Maps

// Using Parameterized Types With Constructors and Functions

//  - replace place holder types (stand-in types / type parameters) explicitly during instantiation of a class or invocation of a function / method

//   - put one or more types between angle brackets (<...>) directly after the class or function name

// Generic collections and the types they contain

//  - generic types are reified in dart, retaining their type information
//    during runtime e.g. a parameterized list literal of <int>[]
//    will be a List<int> at runtime instead of a just a List like in Java
//    which uses erasure instead of reified

// Restricting the Parameterized Type (Bounds)

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