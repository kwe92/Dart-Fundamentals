import '5.5-switch_statements_guard_clause.dart';

// Enhanced enum

//   - multiple unique instances
//   - this keyword references current instance

// Enhanced enum parts and order:

//   - unique instances of the const class
//   - fields (member variables / derivations)
//   - const class constructor
//   - methods

enum Vehicle implements Comparable<Vehicle> {
  bycicle(
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
  ),
  ;

  final int tires;
  final int passengers;
  final int carbonKilometer;
  // computed get dervation - returns a derivative
  int get carbonFootPrint => (carbonKilometer / passengers).round();
  bool get isTwoWheeled => this == Vehicle.bycicle;

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonKilometer,
  });

  @override
  int compareTo(Vehicle other) => this.carbonFootPrint - other.carbonFootPrint;

  @override
  String toString() =>
      '${this.name}(tires: $tires, passengers: $passengers, carbonKilometer: $carbonKilometer, carbonFootPrint: $carbonFootPrint, isTwoWheeled: $isTwoWheeled)';
}

void main() {
  final Vehicle bike = Vehicle.bycicle;
  final Vehicle sedan = Vehicle.car;
  try {
    print('Bike: ${bike}');
    print('Sedan: ${sedan}');
  } catch (errorMsg, stackTrace) {
    print(errorMsg);
    printStackTrace(stackTrace);
  } finally {}
}
