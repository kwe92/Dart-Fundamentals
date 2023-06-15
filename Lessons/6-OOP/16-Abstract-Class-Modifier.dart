// Dart 3 Class Modifiers

// Class Modifiers

//   - Prefix class declaration
//   - Adds additional features and restrictions to class declarations

// abstract class modifier

//  - Can not be instantiated in any module (library)
//  - Sub-types do not require full concrete implementation of entire interface
//  - You don't need to implement the function signatures defined by the super

// abstract methods

//   - replace method body with semi-colon indicates to the compiler that the method is abstract
//   - Only abstract classes can have abstract methods

abstract class Employee {
  final String fname;
  final String lname;
  double salary;
  String get email => "${fname.substring(0, 1).toLowerCase()}${lname.toLowerCase()}@ayonInnovations.net";

  Employee({
    required this.fname,
    required this.lname,
    required this.salary,
  });

  // an abstract method that must be implemented by the sup-type
  void giveRaise(double x);
}

class SoftwareEngineer extends Employee {
  final List<String> progLangs;
  SoftwareEngineer({
    required super.fname,
    required super.lname,
    required this.progLangs,
    required super.salary,
  });

  @override
  void giveRaise(double x) {
    x <= 0.15
        ? this.salary = this.salary + (this.salary * x)
        : print(
            "raise can not exceed 15%",
          );
  }
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

  print(emp1);

  return 0;
}
