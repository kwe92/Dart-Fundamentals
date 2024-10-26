void main() {
  final Vehicle bicycle = Vehicle.bicycle;
  final Vehicle sedan = Vehicle.car;

  print('bicycle: ${bicycle}');

  print('Sedan: ${sedan}');

  print('bicycle carbon footprint: ${bicycle.carbonFootPrint}');

  print(bicycle.additionalFeatures);

  try {
    // throws a run-time exception as you are trying to modify an unmodifiable (const) Array
    bicycle.additionalFeatures[0] = '100 INCH RIMS';
  } catch (err) {
    print(err.toString());
  }
}

enum Vehicle implements Comparable<Vehicle> {
  // the set of fixed known enum instances
  bicycle(
    tires: 2,
    passengers: 1,
    carbonKilometer: 0,
  ),
  car(
    tires: 4,
    passengers: 5,
    carbonKilometer: 400,
  ),
  bus(
    tires: 6,
    passengers: 50,
    carbonKilometer: 800,
  );

  final int tires;

  final int passengers;

  final int carbonKilometer;

  // the field (property / memeber variable) must be final and its value must be constant (immutable - frozen at compile-time)
  final additionalFeatures = const ['padded seating', 'star wheels'];

  // computed get dervation - returns a derivative
  int get carbonFootPrint => (carbonKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonKilometer,
  });

  // TODO: find a use case for a redirect constructor in an enum
  const Vehicle.bike()
      : this(
          tires: 2,
          passengers: 1,
          carbonKilometer: 0,
        );

  // enum factory constructor returning one of the known declared fixed instances car
  factory Vehicle.sedan() => Vehicle.car;

  @override
  int compareTo(Vehicle other) => this.carbonFootPrint - other.carbonFootPrint;

  @override
  String toString() =>
      '${this.name}(tires: $tires, passengers: $passengers, carbonKilometer: $carbonKilometer, carbonFootPrint: $carbonFootPrint, isTwoWheeled: $isTwoWheeled, additionalFeatures: $additionalFeatures)';
}

// Enhanced enum

//   - as the name implies Enhanced Enum's are enhanced with added features
//     beyond a simple fixed set of unique constant values

// Enhanced enum Additional Features:

//   - fields (member variables / derivations)

//   - class methods

//   - const class constructors (limited to a fixed number of known constant instances)

//   - the 'this' keyword references the current instance

// Enhanced Enum Restrictions

//   - instance variables (fields, properties, member variables, etc) must be final

//   - all generative constructors must be constant

//   - factory constructors can only return one of the fixed known enum instances

//   - no other class can be extended as Dart only allows a class to be a subclass of one Super Class (Parent Class)

//   - there must be one declared isntance and all fixed instances must be declared at the top of the class

//?? inheriting from Comparable class is optional
