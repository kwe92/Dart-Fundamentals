// ignore_for_file: file_names, avoid_print

class SalaryException implements Exception {
  SalaryException([message = 'Invalid Message!']) {
    _message = message;
  }
  late String _message;
  @override
  String toString() {
    return _message;
  }
}

void main() {
  var emp1 = Employee('Baki', 'H', 185000.00);

  emp1.info();

  print(emp1.fullname);

  print(emp1.salary);

  var emp2 = Employee('Mugen', 'C', 120000.00);

  print(emp2.fullname);
}

abstract class BaseEmployee {
  BaseEmployee(this.fname, this.lname, salary) {
    if (salary < 90000) {
      throw SalaryException(
          '$salary is an invalid salary, salary must be above 90000');
    } else {
      _salary = salary;
      fullname = '$fname $lname';
      email = '$fname.$lname.AyonInnovations.kings';
    }
  }
  late final String fname;
  late final String lname;
  late final String email;
  late final String fullname;
  late final double _salary;

  BaseEmployee.fromString(String s) {
    var infoStringList = s.split('-');
    fname = infoStringList[0];
    lname = infoStringList[1];
    _salary = double.parse(infoStringList[2]);
    email = '$fname.$lname@AyyonInnovations.kings';
    fullname = '$fname $lname';
  }

  void info();

  get salary {
    return _salary;
  }
}

class Employee extends BaseEmployee {
  Employee(fname, lname, salary) : super(fname, lname, salary);
  Employee.fromString(s) : super.fromString(s);

  void info() {
    print('Full Name: $fullname'
        '\n'
        'Salary: $salary'
        '\n'
        'E-Mail Address: $email');
  }
}

class Programmer extends Employee {
  var progLang;
  Programmer(fname, lname, salary) : super(fname, lname, salary);
}
