sealed class Vehicle {
  const Vehicle();
  // Polymorphism in super class
  void getVehicleSound() => switch (this) {
        Car() => print('vroom'),
        Truck() => 'VROOM',
        Bicycle() => print('click click click'),
      };
}

class Car extends Vehicle {}

class Truck extends Vehicle {}

class Bicycle extends Vehicle {}

// return different implementation depending on the data structure
String getVehicleSound(Vehicle vehicle) => switch (vehicle) {
      Car() => 'vroom',
      Truck() => 'VROOM',
      Bicycle() => 'click click click',
    };

void main() {
  // final Vehicle car0 = Vehicle(); // results in error as sealed classes can not be instantiated

  final car1 = Car();
  final bicycle = Bicycle();

  print(getVehicleSound(Car()));

  print(getVehicleSound(Truck()));

  // Polymorphism (Algebraic Data Type)

  car1.getVehicleSound();

  bicycle.getVehicleSound();
}

//  sealed class modifier - Polymorphism - Algebraic Data Type

//    - a way to construct an Algebraic Data Type

//    - known Compile-time enumerable set of sub-types

//    - create a statically exhaustive switch over sub-types

//    - implicitly abstract and can not be instantiated (constructed)

//    - can have factory constructors

//    - can define constructors for their sub-types to use

// Sub-types of sealed class modifier

//   - not implicitly abstract (can be instatiated)

// Dart: Exhaustiveness

//   - Switches must handle all possible subtypes
