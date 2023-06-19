// Enhanced Enumeration

//   - enum with fields, methods, and a const constructor
//   - declare enum with multiple instances
//   - instance methods use this to reference the current value

// Example: Vehicle enum

//   order:
//     - instance variables
//     - const class constructor

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
  );

  final int tires;
  final int passengers;
  final int carbonKilometer;
  int get carbonFootPrint => (carbonKilometer / passengers).round();
  bool get isTwoWheeled => this == Vehicle.bycicle;

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonKilometer,
  });

  @override
  int compareTo(Vehicle other) => this.carbonFootPrint - other.carbonFootPrint;
}
