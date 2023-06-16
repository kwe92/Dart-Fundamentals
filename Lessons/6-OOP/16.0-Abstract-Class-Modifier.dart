// Dart 3 Class Modifiers

// Class Modifiers

//   - Prefix class declaration
//   - Adds additional features and restrictions to class declarations

// abstract class modifier

//  - Can not be instantiated (constructed) in any module (library)
//  - function signature implementation is not enforced on sub-types

// abstract methods

//   - replace method body with semi-colon, indicating to the compiler that the method is abstract
//   - Only abstract classes can have abstract methods

// Stateful abstract class Employee

abstract class Employee {
  final String fname;
  final String lname;
  late double _salary;

  double get salary => _salary;
  String get email => '${fname.substring(0, 1) + lname}@ayonInnovations.net'.toLowerCase();

  Employee({
    required this.fname,
    required this.lname,
    required double salary,
  }) {
    this._salary = salary;
  }

  // an abstract signature that must be implemented by inheriting sub-types
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
        ? this._salary = this._salary + (this._salary * x)
        : print(
            'raise can not exceed 15%',
          );
  }
}

class RaiseSalaryError extends Error {
  final String? message;
  RaiseSalaryError({required this.message});

  @override
  String toString() => message != null ? message as String : 'Raise amount can not exceed 15%.';
}

int main() {
  final emp1 = SoftwareEngineer(
    fname: 'Kweayon',
    lname: 'Clark',
    progLangs: [
      'SQL',
      'Python',
      'HTML',
      'CSS',
      'Dart',
      'Javascript',
      'Typescript',
    ],
    salary: 130000,
  );

  print(emp1.email + '\n');
  print('Salary: ${emp1.salary}\n');
  emp1.giveRaise(0.14);

  print('Salary after raise: ${emp1.salary}\n');
  try {
    emp1.giveRaise(0.16);
  } catch (error, stackTrace) {
    print('\n Error Message: $error\n');
    print('Stack Trace: $stackTrace\n');
  } finally {
    print('''

Begin, to begin is half the work let half still remain;
Again begin this and thou wilt have finished.

- Marcus A.

''');
  }
// no setter therefore an error will occur
  // emp1.salary = 99999999;

  return 0;
}
