//  sealed class modifier - Polymorphism

//    - Known Compile-time enumerable set of sub-types
//    - Create a switch over sub-types that is statically exhaustive
//    - Implicitly abstract and can not be instantiated (constructed)
//    - Can have factory constructors
//    - Can define constructors for their sub-types to use

// Sub-types of sealed class modifier

//   - Not implicitly abstract (can be instatiated)

// Dart: Exhaustiveness

//   - Switches must handle all possible subtypes

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

String getVehicleSound(Vehicle vehicle) => switch (vehicle) {
      Car() => 'vroom',
      Truck() => 'VROOM',
      Bicycle() => 'click click click',
    };

int main() {
  // final Vehicle car0 = Vehicle(); //// results in error

  final Vehicle car1 = Car();
  final Vehicle bicycle = Bicycle();

  getVehicleSound(Car());
  getVehicleSound(Truck());

  // polymorphism

  car1.getVehicleSound();
  bicycle.getVehicleSound();
//

  return 0;
}
