// ignore_for_file: unused_local_variable

// Named Constructors
//   - implement multiple constructors for a class

class Vehicle {
  final int wheels, passangers;
  final bool motorVehicle, electricVehicle;
  final String? color;

  const Vehicle({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    required this.color,
  });
  Vehicle.bicycle({required String color, bool? motorVehicle, bool? electricVehicle})
      : wheels = 2,
        passangers = 1,
        motorVehicle = motorVehicle ?? false,
        electricVehicle = electricVehicle ?? false,
        color = color;

  Vehicle.sedan({required String color, bool? motorVehicle, bool? electricVehicle})
      : wheels = 4,
        passangers = 5,
        motorVehicle = motorVehicle ?? true,
        electricVehicle = electricVehicle ?? false,
        color = color;

  Vehicle.truck({required String color, bool? motorVehicle, bool? electricVehicle})
      : wheels = 18,
        passangers = 3,
        motorVehicle = motorVehicle ?? true,
        electricVehicle = electricVehicle ?? false,
        color = color;
}

void main() {
  final Vehicle bicycle = Vehicle.bicycle(color: 'Orange');

  final Vehicle motorCycle = Vehicle.bicycle(
    color: 'Black',
    motorVehicle: true,
    electricVehicle: false,
  );

  final Vehicle tesla = Vehicle.sedan(
    color: 'Royal Blue',
    motorVehicle: false,
    electricVehicle: true,
  );

  final Vehicle hondaAccordHybrid = Vehicle.sedan(
    color: 'Royal Blue',
    electricVehicle: true,
  );

  final Vehicle teslaSemiTruck = Vehicle.truck(
    color: 'Silver',
    motorVehicle: false,
    electricVehicle: true,
  );
}
