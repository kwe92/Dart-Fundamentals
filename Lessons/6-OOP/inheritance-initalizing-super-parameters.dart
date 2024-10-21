//!! TODO: see: https://dart.dev/language/constructors#constructor-inheritance:~:text=Constructor%20inheritance-,%23,-Subclasses%2C%20or%20child

class FictonalPerson {
  final String fname, lname;

  final int age;

  const FictonalPerson({
    required this.fname,
    required this.lname,
    required this.age,
  });
}

// with super-initializer parameters
class AnimeCharacter extends FictonalPerson {
  // equivalent to: AnimeCharacter({required int age, required String fname, required String lname}) : super(age: age, fname: fname, lname: lname);
  const AnimeCharacter({
    required super.fname,
    required super.lname,
    required super.age,
  });
}

// without super-initializer parameters, more verbose way to invoke a super constructor
class AnimeCharacter2 extends FictonalPerson {
  const AnimeCharacter2(int age, String fname, String lname) : super(age: age, fname: fname, lname: lname);
}

class Vector2d {
  final double x;
  final double y;

  // Named Constructor
  Vector2d.pointOnCartesianPlane({required this.x, required this.y});

  @override
  String toString() => 'Vector2d(x: $x, y: $y)';
}

class Vector3d extends Vector2d {
  final double z;

  // equivalent to: Vector3d({double? x, required double y, required this.z}) : super.pointOnCartesianPlane(x: x ?? 0, y: y);
  Vector3d({double? x, required super.y, required this.z}) : super.pointOnCartesianPlane(x: x ?? 0);

  @override
  String toString() => 'Vector3d(x: $x, y: $y, z: $z)';
}

void main() {
  final vector2d = Vector2d.pointOnCartesianPlane(
    x: 4.32,
    y: 3.12,
  );

  final vector3d = Vector3d(z: 42, y: 9999);

  final vectors = <dynamic>[vector2d, vector3d];

  for (var vector in vectors) {
    print(vector);
  }
}
// Super Class Constructor Inheritance

//   - super-class constructors CAN NOT be inherited (not even in C++)

//   -  classes inherit the parameters of a super-class, kown as super parameters

//   -super-class parameters must be initialized in the constructor of the sub-class
//    using super-initializer parameters or invoke a super class constructor from the sub-class constructor
//    with an initalizer list (in C++ invoking a super class constructor with an initalizer list is the only way)

//   - you can provide default values to required super-class parameters instead of making them required by the sub-class

// super-initializer parameters

  //   - similar to initialzing formal parameters

  //   - forward parameters to the super constructor avoiding the need to
  //     pass each parameter into the super constructor via an initializer list

// Implementating super-class Constructor (Brevity)

//   - Implementing the super-class constructor is manditory

//   - you can use super.instanceVariable to initalize super-class parameters (super-initalizer parameters)
//     in the head of the sub-class constructor reducing the amount of code needed in order to initalize super-class fields

//   - initalizing variables with super class constructor and initalizer list (allows partial application)
