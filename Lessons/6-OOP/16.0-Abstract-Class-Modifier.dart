abstract class Employee {
  final String fname;

  final String lname;

  double _salary;

  double get salary => _salary;

  String get email => '${fname.substring(0, 1) + lname}@ayonInnovations.net'.toLowerCase();

  // Generative Constructor with Initializer List
  Employee({
    required this.fname,
    required this.lname,
    required double salary,
  }) : _salary = salary;

  // an abstract method signature that must be implemented by inheriting sub-types
  void giveRaise(double x);
}

class SoftwareEngineer extends Employee {
  final List<String> programmingLanguages;

  final List<String> sdks;

  SoftwareEngineer({
    required this.programmingLanguages,
    required this.sdks,
    required super.fname,
    required super.lname,
    required super.salary,
  });

  @override
  void giveRaise(double x) {
    x <= 0.15 ? this._salary = this._salary + (this._salary * x) : throw RaiseSalaryError();
  }
}

void main() {
  final emp1 = SoftwareEngineer(
    fname: 'Kweayon',
    lname: 'Clark',
    salary: 130000,
    programmingLanguages: ['SQL', 'Python', 'HTML', 'CSS', 'Dart', 'JavaScript', 'TypeScript', 'Go'],
    sdks: ['Flutter', 'React'],
  );

  print(emp1.email + '\n');

  print('Salary: ${emp1.salary}\n');

  emp1.giveRaise(0.14);

  print('Salary after raise: ${emp1.salary}\n');

  try {
    emp1.giveRaise(0.16);
  } catch (error, stackTrace) {
    print('ERROR: ${error.toString()}\n');
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
}

class RaiseSalaryError extends Error {
  final String message;

  RaiseSalaryError({this.message = 'Raise amount can not exceed 15%.'});

  @override
  String toString() => message;
}

// Dart 3 Class Modifiers

// Class Modifiers

//   - Prefixes class declaration

//   - Adds additional features and restrictions to class declarations

// Interface

//   - the highest level of abstraction for an object

//   - defines a contract specifying the set of methods a class must implement

//   - contains only the signatures of methods omitting any implementation details

// abstract class modifier

//   - Some Object-Oriented languages do not have interfaces but rather an Abstract Class that can act as an Interface

//   - abstract classes can declare instance fields and have a set of method signatures to be implemented by sub-types

//   - abstract classes can not be instantiated (constructed) directly in any module (library)

//   - unlike traditional Interfaces Abstract Classes can provide implementations
//     for methods if they choose too but typically don't

// abstract methods

//   - equivalent to Interface methods, providing only the signature of a method that must be implemented
//     by sub-types

//   - replace method body with semi-colon, indicating to the compiler that the method is abstract

//   -  abstract methods can only be defined in abstract classes

// Initializing Private Fields as Initializing Formal Parameters

//   - private fields can't be used as named initializing formals
//     and must be initialized with an initializer list instead
//     or marked as late and initialized in the constructor body (not idomatic nor recommended)

//   - private fields can be used as positional initializing formals


