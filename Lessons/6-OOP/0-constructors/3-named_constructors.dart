class Vehicle {
  final int wheels;
  final int passangers;
  final bool motorVehicle;
  final bool electricVehicle;
  final String? color;

// Named Constructor
  Vehicle.create({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    this.color,
  });

  @override
  String toString() =>
      'Vehicle(wheels: $wheels, passangers: $passangers, motorVehicle: $motorVehicle, electricVehicle: $electricVehicle, color: $color)';
}

// super class Vehicle lacks unnamed, no argument constructor so it is required to call the super classes named constructor with an initializer list
class Car extends Vehicle {
  // Vehicle does not have a default constructor

  // you must call super.create()
  Car.create({
    required int passangers,
    required bool motorVehicle,
    required bool electricVehicle,
    int wheels = 4,
    String? color,
  }) : super.create(
          wheels: wheels,
          passangers: passangers,
          motorVehicle: motorVehicle,
          electricVehicle: electricVehicle,
          color: color,
        );
}

void main() {
  final teslaSemiTruck = Vehicle.create(
    wheels: 18,
    passangers: 4,
    color: 'blue-grey',
    motorVehicle: false,
    electricVehicle: true,
  );

  print(teslaSemiTruck);
}

// Named Constructors

//   - named constructors serve two purposes:

//       - add clarification to the purpose of a constructor removing ambiguity

//       - allow the implementation of multiple constructors within a class

//   - when a named constructor is specified the default constructor is implicitly removed
//     and an unnamed constructor must be explicitly implemented

//   - subclasses that extend a superclass will not inherit the named constructors of the superclass
//     the named constructors in a super class must explicitly be implemented in the subclass

// Named Constructor Syntax:

//   - ClassName.identifier(args, kwargs)

// Non-default superclass constructors

//   - when you implement a constructor explicitly the default constructor is implictly removed

//   - you must call one of the super classes implemented constructors in the above case

//   - you must call the constructor but you do not have to use the same type of constructor
//     i.e. if the super class constructor is named you can use a generative constructor in
//     the sub-type and invoke the super classes named constructor but you can not use super-initializer parameters
//     and must explicitly pass each parameter into the super classes named invocation

// Dart executes constructors in the following order:

//   - initializer list

//   - superclass unnamed, no-arg constructor

//   - main class no-arg constructor