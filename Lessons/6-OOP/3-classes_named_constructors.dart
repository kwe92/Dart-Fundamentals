// TODO: Break apart into multiple lessons maybe?

// Named Constructors

//   - implement multiple constructors for a class

// Named Constructor Syntax:

//   - ClassName.identifier(args, kwargs)

// Types of Named Constructors:

//   - Named Generator Constructor
//   - Initalizer List Constructor
//   - Factory Constructor
//   - Redirecting Constructor

class Vehicle {
  final int wheels, passangers;
  final bool motorVehicle, electricVehicle;
  final String? color;
  static int _createdVehicleCount = 0;
  static int get numCreatedVehicles => _createdVehicleCount;

  const Vehicle({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    this.color,
  });

  // Factory Named Constructor
  factory Vehicle.fromJSON(Map<String, dynamic> json) => Vehicle(
        wheels: json['wheels'],
        passangers: json['passangers'],
        motorVehicle: json['motorVehicle'],
        electricVehicle: json['electricVehicle'],
        color: json['color'],
      );

  // Redirecting Named Constructor

  Vehicle.redirector({required bool isElectric, String? color})
      : this(
          wheels: 4,
          passangers: 5,
          motorVehicle: isElectric ? false : true,
          electricVehicle: !isElectric ? false : true,
          color: color ?? 'royal blue',
        );

  // Named Generator Constructor

  Vehicle.create({
    required this.wheels,
    required this.passangers,
    required this.motorVehicle,
    required this.electricVehicle,
    this.color,
  }) {
    _createdVehicleCount += 1;
  }

// Initalizer List Named Constructor

//   - Executes before the Unnamed Constructor

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

  @override
  String toString() =>
      'Vehicle(wheels: $wheels, passangers: $passangers, motorVehicle: $motorVehicle, electricVehicle: $electricVehicle, color: $color)';
}

Future<Map<String, dynamic>> useFetchSportback() async {
  await Future.delayed(
    Duration(
      seconds: 1,
      milliseconds: 100,
    ),
  );
  return {
    'wheels': 4,
    'passangers': 5,
    'motorVehicle': true,
    'electricVehicle': false,
  };
}

Future<void> main() async {
  final Map<String, dynamic> vehicleJSON = await useFetchSportback();
  final Vehicle bicycle = Vehicle.bicycle(color: 'Orange');

  final Vehicle kawasakiEbike = Vehicle.create(
    wheels: 2,
    passangers: 2,
    motorVehicle: false,
    electricVehicle: true,
    color: 'green-blue-silver',
  );
  final Vehicle tesla = Vehicle.redirector(
    isElectric: true,
    color: 'black',
  );

  final Vehicle hondaAccordHybrid = Vehicle.sedan(
    color: 'Royal Blue',
    electricVehicle: true,
  );

  final Vehicle teslaSemiTruck = Vehicle.create(
    wheels: 18,
    passangers: 4,
    color: 'blue-grey',
    motorVehicle: false,
    electricVehicle: true,
  );

  final Vehicle s5Sportback = Vehicle.fromJSON(vehicleJSON);

  final List<Vehicle> fleet = [
    bicycle,
    kawasakiEbike,
    tesla,
    hondaAccordHybrid,
    teslaSemiTruck,
    s5Sportback,
  ];

  print('\n');

  fleet.asMap().forEach(
        (int index, Vehicle vehicle) => print('${index + 1}: $vehicle\n'),
      );
}
