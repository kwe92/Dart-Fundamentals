// https://dart.dev/null-safety/understanding-null-safety#nullability-and-generics

// ignore_for_file: unused_local_variable

class Box<T> {
  // pontentially nullable type
  final T object;

  // initialized required positional formal parameter
  Box(this.object);
}

class PotentiallyEmptyBox<T> {
  // explicitly nullable type parameter
  T? _object;

  PotentiallyEmptyBox.empty();

  PotentiallyEmptyBox.filled(this._object);

  T unbox() => _object as T; // explicit as T casting awat nullability
}

void main() {
  final box0 = Box<void>(1); // instantiated as void, and value can't be used

  final box2 = Box<String>("I'm a rock in a box with no socks in Fort Knox."); // instantiated as non-nullable String

  final box3 = Box<int?>(42); // instantiated as nullable int

  final emptyBox = PotentiallyEmptyBox.empty();

  final filledBox = PotentiallyEmptyBox<String>.filled('Single-minded effort.');

  print('empty box value: ${emptyBox.unbox()}');

  print('filled box box value: ${filledBox.unbox()}');

  try {
    // produces runtime error
    final shouldBeFilledBox = PotentiallyEmptyBox<String>.filled(null);

    print(shouldBeFilledBox.unbox());
  } catch (err, st) {
    print(err.toString());

    print(st.toString());
  }
}

// Potentially Nullable Types

//   - if you omit the bound of a generic stand-in type T (type parameter), not making T a sub-class of a specific type (i.e. T extends SomeClass)
//     then the stand-in type (type parameter) will be considered a potentially nullable type defaulting to Object? (meaning any object at all or null)

//   = potentially nullable types have all the restrictions of both nullable and non-nullable type

//   - nullable type restrictions: the type can not use properties or methods not implemented by Object until nullability is handled

//   - non-nullable type restrictions: class fields must be initialized before reaching the constructor through any of the various ways
//                                     an instance field can be initialized

// Generic Classes With Uninitialized Fields

//   - to leave the initialization of a field optional (uninitialized)
//     it must not be final and must be an explicitly nullable type or type parameter in the case of generics

//   - all final variables (nullable or non-nullable) must be initialized

// Casting Away Type Parameter Nullability

//   - cast away type parameter nullability by an explicit as T cast