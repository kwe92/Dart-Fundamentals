// TODO: add sealed from docs

// Dart 3 Class Modifiers

// Class Modifiers

//   - Prefix class declaration
//   - Controls how and where a class can be used

// abstract class modifier

//  - Can not be instantiated in any module (library)
//  - Sub-types do not require full concrete implementation of entire interface
//  - You don't need to implement the function signatures defined by the super

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
  final List<String> progLangs;
  const SoftwareEngineer({
    required super.fname,
    required super.lname,
    required this.progLangs,
    required super.salary,
  });
}

int main() {
  final emp1 = SoftwareEngineer(
    fname: "Kweayon",
    lname: "Clark",
    progLangs: [
      "SQL",
      "Python",
      "HTML",
      "CSS",
      "Dart",
      "Javascript",
      "Typescript",
    ],
    salary: 130000,
  );

  print(emp1.email);

  return 0;
}
