// Inheriting Constructors

//     - super-class constructors CAN NOT be inherited

//     - You MUST implement the super-class constructor in the sub-class

// Implementating super-class constructor (Brevity)

//   - Implementing the super-class constructor is manditory

//   - you can use super.instanceVariable to initalize super-class parameters
//     in the head of the sub-class constructor
//     reducing the amount of code needed in order to initalize super-class variables

class FictonalPerson {
  final String fname, lname;
  final int age;

  const FictonalPerson({
    required this.fname,
    required this.lname,
    required this.age,
  });
}

class AnimeCharacter extends FictonalPerson {
  // no variables redefined
  const AnimeCharacter({
    required super.fname,
    required super.lname,
    required super.age,
  });
}

class Vector2d {
  final double x;
  final double y;

  // Named Constructor
  //
  Vector2d.pointOnCartesianPlane({required this.x, required this.y});

  @override
  String toString() => 'Vector2d(x: $x, y: $y)';
}

class Vector3d extends Vector2d {
  final double z;

  // initalizing variables with super class constructor and initalizer list (allows partial application)
  Vector3d({required this.z, required super.y}) : super.pointOnCartesianPlane(x: 0);

  @override
  String toString() => 'Vector3d(x: $x, y: $y, z: $z)';
}

void main() {
  final Vector2d vector2d = Vector2d.pointOnCartesianPlane(
    x: 4.32,
    y: 3.12,
  );

  final Vector3d vector3d = Vector3d(z: 42, y: 9999);

  final List vectors = [vector2d, vector3d];

  for (var vector in vectors) {
    print(vector);
  }
}
