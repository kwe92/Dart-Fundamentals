class Vehicle {
  final int wheels, passangers;
  final bool motorVehicle, electricVehicle;
  final String? color;

  // constant Generative Constructor creating immutable instances of a Vehicle
  const Vehicle({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    this.color,
  });

  // Named Constructor
  Vehicle.create({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    this.color,
  });

  // Factory Named Constructor
  factory Vehicle.fromJSON(Map<String, dynamic> json) {
    // do some preprocessing...

    // finished preprocessing...

    // return instance of the class after preprocessing
    return Vehicle(
      wheels: json['wheels'],
      passangers: json['passangers'],
      motorVehicle: json['motor_vehicle'],
      electricVehicle: json['electric_vehicle'],
      color: json['color'],
    );
  }

  // Redirecting Constructor
  Vehicle.sedan({required String color, bool? motorVehicle, bool? electricVehicle})
      : this(
          wheels: 4,
          passangers: 5,
          motorVehicle: motorVehicle ?? true,
          electricVehicle: electricVehicle ?? false,
          color: color,
        );

// Named Constructor With Initalizer List

//   - Executes before the Unnamed Constructor
  Vehicle.bicycle({required String color, bool? motorVehicle, bool? electricVehicle})
      : wheels = 2,
        passangers = 1,
        motorVehicle = motorVehicle ?? false,
        electricVehicle = electricVehicle ?? false,
        color = color {
    print('created: $this in named constructor with initializer list');
  }

  @override
  String toString() =>
      'Vehicle(wheels: $wheels, passangers: $passangers, motorVehicle: $motorVehicle, electricVehicle: $electricVehicle, color: $color)';
}

Future<void> main() async {
  final vehicleJSON = await useFetchVehicleData();

  final bicycle = Vehicle.bicycle(color: 'Orange');

  final kawasakiEbike = Vehicle.create(
    wheels: 2,
    passangers: 2,
    motorVehicle: false,
    electricVehicle: true,
    color: 'green-blue-silver',
  );
  final tesla = Vehicle.sedan(
    motorVehicle: false,
    electricVehicle: true,
    color: 'black',
  );

  final hondaAccordHybrid = Vehicle.sedan(
    color: 'Royal Blue',
    electricVehicle: true,
  );

  final teslaSemiTruck = Vehicle.create(
    wheels: 18,
    passangers: 4,
    color: 'blue-grey',
    motorVehicle: false,
    electricVehicle: true,
  );

  final s5Sport = Vehicle.fromJSON(vehicleJSON);

  final fleet = [
    bicycle,
    kawasakiEbike,
    tesla,
    hondaAccordHybrid,
    teslaSemiTruck,
    s5Sport,
  ];

  print('\n');

  fleet.asMap().forEach((index, vehicle) => print('${index + 1}: $vehicle\n'));
}

Future<Map<String, dynamic>> useFetchVehicleData() async {
  final delay = Duration(seconds: 1, milliseconds: 100);

  await Future.delayed(delay);

  return {
    'wheels': 4,
    'passangers': 5,
    'motor_vehicle': true,
    'electric_vehicle': false,
  };
}
