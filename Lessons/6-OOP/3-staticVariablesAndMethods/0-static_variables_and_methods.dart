// ignore_for_file: unused_local_variable

abstract class Person {
  final String fname;
  final String lname;
  final int age;

  const Person({required this.fname, required this.lname, required this.age});
}

class Employee extends Person {
  static int _employeeCnt = 0;

  static int get employeeCnt => _employeeCnt;

  static double _totalSalaries = 0;

  final int employeeId;

  final double salary;

  Employee({
    required this.employeeId,
    required this.salary,
    required super.fname,
    required super.lname,
    required super.age,
  }) {
    print('\nEmployee hired: ${fname} ${lname}');

    _employeeCnt += 1;

    _totalSalaries += salary;
  }

  static double getTotalSalaries() => _totalSalaries;
}

void main() {
  final emp0 = Employee(
    employeeId: 1001,
    salary: 130000.00,
    fname: 'Kweayon',
    lname: 'Clark',
    age: 32,
  );
  final emp1 = Employee(
    employeeId: 1002,
    salary: 90000.00,
    fname: 'Baki',
    lname: 'Hanma',
    age: 19,
  );
  final emp2 = Employee(
    employeeId: 1003,
    salary: 110000.00,
    fname: 'Gaara',
    lname: 'Sabaku',
    age: 15,
  );

  print('\nStatic variable access via Class: ${Employee.employeeCnt}\n');

  print('total salaries: ${Employee.getTotalSalaries()}');

// Accessing a static method through an instance
// will result in a compile-time error

// emp0.employeeCnt
}

// Class Variables - Static Variables

//   - class wide state and constant variables

//   - can be accessed by all instances of a class

//   - useful to manage a cache or counter (number of class instances)

//   - there are many other uses as well

// Static Methods

//   - static methods are specific to the class itself

//   - useful for creating namespaces for a collection of related methods

//   - there are many other uses as well

//   - instances do not have access to static class methods (class wide functions)

//       - although instance methods can call static methods

//   - attempting to access a static class method
//     through an instance of a class will result in error

//   - static methods also do not operate on instances of a class therefore do not have access to 'this'

//   - you can use static methods as compile-time constants
//     for example, you can pass a static method as a parameter to a constant constructor