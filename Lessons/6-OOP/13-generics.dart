import 'dart:math';

abstract base class AbstractBasePoint<T extends num> {
  final T x, y;

  const AbstractBasePoint({
    required this.x,
    required this.y,
  });

  T euclideanDistance(Point other);

  @override
  String toString() => 'Point($x, $y)';
}

final class Point<T extends num> extends AbstractBasePoint<T> {
  const Point({
    required super.x,
    required super.y,
  });

  @override
  T euclideanDistance(Point other) => T == int
      ? sqrt(
          pow((other.x - this.x), 2) + pow((other.y - this.y), 2),
        ).toInt() as T
      : sqrt(
          pow((other.x - this.x), 2) + pow((other.y - this.y), 2),
        ) as T;
}

void main() {
  final p0 = Point(x: -1, y: 12);
  final p1 = Point<double>(x: 3.321321321, y: 2.321321);

  final distance00 = p0.euclideanDistance(p1);

  final distance01 = p1.euclideanDistance(p0);

  // the reified run-time type information is retained
  print('\n' + 'x run time type: ${p0.x.runtimeType}\n');

  print('y run time type: ${p0.y.runtimeType}\n');

  print('int euclidean distance between:\n\n$p0 and $p1:\n\n${distance00}\n');

  print('double euclidean distance between:\n\n$p0 and $p1:\n\n${distance01}\n');
}
//?------ REVISED

// Generic Types (Parameterized Types)

//   - an object-oriented programming feature that gives functions and classes 
//     the ability to work with any type without requiring specific types to be predefined statically

//   - the range (bound) of accepted type arguments can be limited to a subset of types
//     instead of all available types, adding additional flexibility

//   - generics achieve both abstraction and polymorphism:

//       - Abstraction: 
//
//           - they allow you to write code that operates on a general concept
//             expressed as a class or function without specifying the concrete type of element
//             (e.g., a list)

//       - Polymorphism:

//           - they enable the same code to be applied to different types at runtime

//   - promotes code reuse and reduces code duplication (DRY principle)

// Placeholder Type | Type Variable | Type Parameter | Stand-in Type

//   - a single capitalized letter (e.g., T, E, K, V) represents a placeholder 
//    for a type within a generic, placeholders are also known as type parameter

// Parameterized Notation
//
//   - to define a generic function or class, the type parameter is placed within angle brackets (<>)
//     after the function or class name. For example: List<T>, Map<K, V>

//   - the type parameter can then be used anywhere a type annotation would be used

// Type Bounds

//   - to constrain the types that can be used as a type parameter
//     you can use the extends keyword followed by the type

//   - for example:

//       - List<T extends num> ensures that the T type parameter
//         must be a subclass of a non-nullable num

// Unconstrained Type Bounds

//   - if the bound of a type parameter is left unconstrained then the
//     type parameter could be any nullable or non-nullable type at runtime

//   - unconstrained type parameters have the properties of both
//     nullable and non-nulable types:

//       - they only have methods definied on type Object

//       - they must be initialized in a class given one of the three initialization methods


// Generics: reified 

//   - "reification" means type information is available at runtime
//     While generics retain type information at compile time if an
//     explicit type argument is passed into the type parameter or if the type is inferred correctly

//   - specific type information is only available at runtime
