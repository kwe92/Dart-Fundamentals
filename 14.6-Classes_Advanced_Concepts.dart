// ignore_for_file: file_names, avoid_print

class SalaryException implements Exception {
  SalaryException([message = 'Invalid Message!']);
  late final _message;
  String get message => _message;
}

abstract class BaseEmployee {
  BaseEmployee(this.fname, this.lname, this._salary) {
    if (_salary < 90000) {
      throw SalaryException(
          '$_salary is an invalid salary, salary must be above 90000');
    }
  }
  final String fname;
  final String lname;
  double _salary;

  double get salary => _salary;
  String get fullname => '$fname $lname';
  String get email => '$fname.$lname@AyonInnovations.org';

  // TODO: Add a named constructor to instantiate BaseEmployee from a string
  void info();
}

class Employee extends BaseEmployee {
  Employee(fname, lname, salary) : super(fname, lname, salary);
  // Employee.fromString(s) : super.fromString(s); Initalizer list for alt named constructor

  String info() {
    return 'Name: $fullname'
        '\n'
        'Salary: $salary'
        '\n'
        'E-mail: $email';
  }
}

class Programmer extends Employee {
  Programmer(fname, lname, salary, {required this.progLang})
      : super(fname, lname, salary);

  final progLang;

  @override
  String info() => super.info() + '\n' 'Programming language: $progLang';
}

void main() {
  final Employee emp1 = Employee('Baki', 'Hanma', 185000.00);

  final Employee emp2 = Employee('Mugen', 'Infinity', 120000.00);

  final Programmer prog1 =
      Programmer('Takagi', 'Fujimaru', 220000.00, progLang: 'C++');

  print('print 0: ${emp1.info()}');
  lineSpace();
  print('print 1: ${emp1.fullname}');
  lineSpace();
  print('print 2: ${emp1.salary}');
  lineSpace();
  print('print 3: ${emp2.fullname}');
  lineSpace();
  print('print 4: ${prog1.info()}');
}

void lineSpace() =>
    print('---------------------------------------------------');
