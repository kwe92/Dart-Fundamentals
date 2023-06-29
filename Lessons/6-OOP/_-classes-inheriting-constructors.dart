// Inheriting Constructors

//     - super-class constructors CAN NOT be inherited
//     - You MUST implement the super-class constructor in the sub-classes
//     - If the implementation of the super class constructor is ommited
//       the super class unnamed no argument constructor is used
//     - Unnamed no argument constructors are the default constructors
//       for all omissions of a class constructor

class Vehicle {
  final int wheels, passangers;
  final String color;
  final bool motorVehicle;
  final bool electricVehicle;

  const Vehicle({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    required this.color,
  });

  @override
  String toString() =>
      'Vehicle(wheels: $wheels, passangers: $passangers, motorVehicle: $motorVehicle, electricVehicle: $electricVehicle, color: $color);';
}

// Implementating super-class constructor

//   - Implementing the super-class constructor is manditory
//   - replace this.memberVariable with super.memberVariable
//   - you do not need to re-declare member variables

class ExtendedVehicle extends Vehicle {
  // no variables declared | only the implementation of the super-type constructor
  const ExtendedVehicle({
    required super.wheels,
    required super.passangers,
    required super.motorVehicle,
    required super.electricVehicle,
    required super.color,
  });
}

void main() {
  final Vehicle bmwM5 = Vehicle(
    wheels: 4,
    passangers: 5,
    motorVehicle: true,
    electricVehicle: false,
    color: 'Grey',
  );

  print('BMW $bmwM5');
}
