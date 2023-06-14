import 'dart:math';

import '14.2-Classes_Operator_Overloading_Covariant.dart';

// TODO: Sealed

// Dart 3 Class Modifiers

// Class Modifiers
//   - Prefix class declaration
//   - Controls how and where a class can be used

// abstract class modifier
//   - Sub-classes do not require full concrete implementation of entire interface
//   - You don't need to implement the function signatures

abstract class Employee {
  final String fname;
  final String lname;
  final double salary;
  String get email => "${fname.substring(0, 1).toLowerCase()}${lname.toLowerCase()}@ayonInnovations.net";

  const Employee({
    required this.fname,
    required this.lname,
    required this.salary,
  });

  void giveRaise(double x) {}
}

class SoftwareEngineer extends Employee {
  const SoftwareEngineer({
    required super.fname,
    required super.lname,
    required super.salary,
  });
}

// base class modifier
// - base classes must have their signatures implemented
// - Can be instantiated, but why would you

base class BasePoint {
  final double x;
  final double y;
  const BasePoint({required this.x, required this.y});

  void euclideanDistance(BasePoint point) {}
}

final class Point extends BasePoint {
  const Point({required super.x, required super.y});

  double euclideanDistance(BasePoint point) => sqrt(
        pow((point.x - this.x), 2) + pow((point.y - this.y), 2),
      );
}

final class Point2 extends Point {
  const Point2({required super.x, required super.y});
}
// Combining modifiers: abstract base classes
//   - modifiers can be combined to create new modifiers

abstract base class VonNeumannModel {
  final String cpu;
  final double memory;
  final double storage;

  const VonNeumannModel({
    required this.cpu,
    required this.memory,
    required this.storage,
  });

  void addMemory(double ram) {}
  void addStorage(double diskSpace) {}
}

final class Computer extends VonNeumannModel {
  const Computer({
    required super.cpu,
    required super.memory,
    required super.storage,
  });
}

int main() {
  final emp1 = SoftwareEngineer(
    fname: "Kweayon",
    lname: "Clark",
    salary: 130000,
  );
  final point1 = Point(x: 4, y: 2);

  final VonNeumannModel comp1 = Computer(cpu: "Intel Core i9-13900KS", memory: 99999, storage: 99999);

  print(emp1.email);
  print(point1.euclideanDistance(Point(x: 16, y: 12)));
  print("CPU: ${comp1.cpu}");

  return 0;
}
