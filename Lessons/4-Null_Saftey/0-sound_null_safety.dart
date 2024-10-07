import 'dart:math';

void main() {
  // explain why the following does not need to have an inital value and what compile time error would occur
  int number = 42;

  var number2 = 42.0;

  print('number has a run-time type of ${number.runtimeType} and can not be assigned the value null');

  print('number has a run-time type of ${number2.runtimeType} and can not be assigned the value null');

  var isNull = Random().nextBool();

  int? number3 = isNull == true ? null : 9999;

  print(number3);

  try {
    var defaultToDynamicType = null;

    // can attempt to call any method and will not be a compile-time / edit-time error
    defaultToDynamicType.toList();
  } catch (err, _) {
    print('Run-time Error: \n${err.toString()}');
  }
}

// Null

//   - represents the absence of a value

//   - the default value passed to all declared fields and variables that are not initialized with a value
//     including non-nullable variables and fields (more on the additional restrictions surrounding this will be discussed bellow)

//   - the default return type of a function ommiting the return statement

// Sound Null Safety

//   - core paradigm, code should be safe by default

//   - Sound Null Safety aims to reduce the amount of bugs in a program by explicitly indicating a type can be Null

//   - it is a compile-time error to initialize a variable with null that
//     has not been declared as nullable or dynamic (by type annotation or by use of var keyword)

//   - null saftey aims to prevent null dereference errors (attepting to acess properties and methods on absent values which have none)

//   - inferred types are implicitly non-null (unless the type is inferred to be dynamic)

// Nullable Types

//   - suffixing a type annotation (base type / static type) or type argument with ? makes the type nullable e.g. T?

//   - nullable types can be viewed as a Union of types between the type Null and the specified base type T

//       - String? == String | Null (String or Null)

//       - similar to the Type Script Union Type of:

//           string | undefined (string or undefined)

//   - dart does not support full-featured union types and the above example illustrates
//     what is done under the hood

// Dart Null Safety Principles

//   - Non-nullable by default

//       - Dart must explicitly be told a variable has the possibility to be null
//         with a few exceptions:

//           - the type annotation of a variable is dynamic

//           - the inferred type of a variable is dynamic

//           - the var keyword is used and initialized with null or not initialized at all
//             defaulting to being inferred as the dynamic type

//           - the dynamic type turns off compile-time null safety for a variable
//             allowing you to access or call any arbitrary property or method only failing at run-time

//   - Sound Null Safe Code - (Soundness)

//       - if the type system determines that an expression doesn't have a static type
//         that can be null it can never evaluate to null, enabling compiler optimizations
//         mainly through static checking

//       - bypassing static checks and evaluating an expression at run-time is possible but only
//         explicitly by developer choice

// Static Typing

//   - allows your program to fail fast and early (at compile-time)
//     as the type checker will notify you of mistakes in your IDE (tooling)

// Compiler Optimizations

//   - Soundness allows the compiler to assume the properties of of Null are always true

//   - allowing less code and less null checks before calling a method

// Representing Any Type Statically

//   - if you want to reference a value that can be of any type
//     and still retain Sound Null Safety (compile-time checks for properties and methods)
//     then use the type annotation or type argument of:

//       - Object?

//   - if you want to reference a value that can be of any type
//     and evaluate that value at run-time then use the type annotation or type argument of:

//       - dynamic

// Sound Null Safety - Invalid Returns

//   - by default a function without a return statement implicitly returns null

//   - if a functions return type is niether void or nullable all
//     paths through the function (control flow statements and branches) must return a value
//     or a compile-time error is thrown

// Sound Null Safety - Uninitialized Variables

//   - uninitialized variables implicitly default to null

// Sound Null Safety - Non-nullable Global Variables and Static Fields

//   - top-level variables (global variables) and static fields part of a class
//     must have an initializing expression (be initialized) when declared 

//   - as it is impossible for the compile to check if the variable has been given a value before use

// Sound Null Safety - Class Fields (Instance Fields)

//   - instance fields must have a value before reaching the constructor body unless prefixed with the late keyword

//   - instance fields must either:

//     - have an initializer at the declaration

//     - use an initializing formal (be a parameter of the constructor function)

//         - e.g. ClassConstructor(this.initializingFormal)

//     - be initialized in the constructor's initialization list

// Sound Null Safety - Non-nullable Local Variables (not part of the global scope)

//   - non-nullable local variables do not need to be initalized with a value

//   - non-nullable local variable are required to have a value before use or a compile-time error will be thrown

// Control Flow Analysis

//   - static-code analysis at compile-time rather than run-time

//   - analizes control flow statements at compile time rather then at runtime (execution time)