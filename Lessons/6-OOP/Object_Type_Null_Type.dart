// ignore_for_file: unused_local_variable

// Object Type Hierarchy

//   - The base class for all non-nullable Objects in Dart
//   - The root of the non-nullable Type heirarchy
//   - ALL non-nullable Classes are a sub-type of Object
//   - Object is implemented implicitly
//     on all non-nullable sub-types

class Person {
  final String fname, lname;
  final int age;
  const Person({
    required this.fname,
    required this.lname,
    required this.age,
  });
}

// Generic Predicate function
//   -  checks whether a type is an object or not

bool isObject<T>(T type) {
  final bool isObject = type is Object;
  print('\n${type.runtimeType} is in the Object hierarchy: ${isObject}\n');
  return isObject;
}

void main() {
  final person = Person(
    fname: 'Gaara',
    lname: 'Subaka',
    age: 15,
  );

  final String? nullableString;

  isObject(person);

// Null Type

//   - Null is a special class that is a type hierarchy unto itself
//     which only consists of the value null
//     Null is NOT part of the Object type hierarchy
//   - compile-time error is thrown in your IDE
//     if a value is unassigned (initalized as null and never re-initalized)

// The bellow code will fail

// isObject(nullableString);
}
