// TODO: Add Explanatory Comments

class SalaryException implements Exception {
  SalaryException([this._message = 'Invalid Message!']);
  String _message;
  String get message => _message;
}

abstract class BaseEmployee {
  // default constructor
  BaseEmployee(this.fname, this.lname, this._salary) {
    if (_salary < 90000) {
      throw SalaryException(
              '$_salary is an invalid salary, salary must be above 90000.00')
          .message;
    }
  }

  // Named constuctor - (alt constructor)
  BaseEmployee.fromString(String employee)
      : fname = employee.split('-')[0],
        lname = employee.split('-')[1],
        _salary = double.parse(employee.split('-')[2]);

  final String fname;
  final String lname;
  // Private Variable mutable variable _salary
  double _salary;

  // Computed getter variables
  double get salary => _salary;
  String get fullname => '$fname $lname';
  String get email => '$fname.$lname@AyonInnovations.org';

  String info() => 'Name: $fullname'
      '\n'
      'Salary: $salary'
      '\n'
      'E-mail: $email';
}

class Employee extends BaseEmployee {
  Employee(fname, lname, salary) : super(fname, lname, salary);
  Employee.fromString(s) : super.fromString(s);
}

class Programmer extends BaseEmployee {
  Programmer(fname, lname, salary, {required this.progLang})
      : super(fname, lname, salary);
  Programmer.fromString(s, this.progLang) : super.fromString(s);

  final progLang;

  @override
  String info() => super.info() + '\n' 'Programming language: $progLang';
}

void main() {
  final Employee emp1 = Employee('Baki', 'Hanma', 185000.00);

  final Employee emp2 = Employee('Mugen', 'Infinity', 120000.00);

  final Employee emp3 = Employee.fromString('Edward-Elric-500000.00');

  final Programmer prog1 =
      Programmer('Takagi', 'Fujimaru', 220000.00, progLang: 'C++');

  final Programmer prog2 =
      Programmer.fromString('Alphonse-Elric-320000.00', 'C++');

  // final Programmer prog3 =
  // Programmer('Nine', 'Unknwon', 50000.00, progLang: 'Haskell');

  print('print 0: ${emp1.info()}');
  lineSpace();
  print('print 1: ${emp1.fullname}');
  lineSpace();
  print('print 2: ${emp1.salary}');
  lineSpace();
  print('print 3: ${emp2.fullname}');
  lineSpace();
  print('print 4: ${prog1.info()}');
  lineSpace();
  print('print 5: ${emp3.info()}');
  lineSpace();
  print('print 6: ${prog2.info()}');
}

void lineSpace() =>
    print('---------------------------------------------------');
