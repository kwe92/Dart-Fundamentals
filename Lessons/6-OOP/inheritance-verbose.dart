// Inheriting Constructors

//     - super-class constructors CAN NOT be inherited
//     - You MUST implement the super-class constructor in the sub-class
//     - If the implementation of the super class constructor is ommited
//       the super class unnamed no argument constructor is used
//     - Unnamed no argument constructors are the default constructors
//       for all omissions of class constructors

class Vehicle {
  final int wheels, passangers;
  final String color;
  final bool motorVehicle;
  final bool electricVehicle;

  const Vehicle(
    this.wheels,
    this.passangers,
    this.motorVehicle,
    this.electricVehicle,
    this.color,
  );

  @override
  String toString() =>
      'Vehicle(wheels: $wheels, passangers: $passangers, motorVehicle: $motorVehicle, electricVehicle: $electricVehicle, color: $color);';
}

// Implementating super-class constructor (VERBOSE)

//   - Implementing the super-class constructor is manditory

class ExtendedVehicle extends Vehicle {
  final int wheels, passangers;
  final String color;
  final bool motorVehicle;
  final bool electricVehicle;

  const ExtendedVehicle(
    int this.wheels,
    int this.passangers,
    String this.color,
    bool this.motorVehicle,
    bool this.electricVehicle,
  ) : super(
          wheels,
          passangers,
          motorVehicle,
          electricVehicle,
          color,
        );
}

void main() {
  final Vehicle bmwM5 = Vehicle(
    4,
    5,
    true,
    false,
    'Grey',
  );

  print('BMW $bmwM5');
}
