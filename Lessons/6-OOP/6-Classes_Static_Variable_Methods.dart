// Class Variables - Static Variables

//   - class wide state and constant variables
//   - ALL instances share class variables

// Static Methods

//   - static methods are specific to the class itself
//   - useful for created namespaces for collections of
//     functions
//   - instances do not have access to
//     static class methods (class wide functions)
//   - attempting to access a static class method
//     through an instance of a class will result in error

// ignore_for_file: unused_local_variable

class Person {
  final String fname;
  final String lname;
  final int age;
  const Person({
    required this.fname,
    required this.lname,
    required this.age,
  });
}

class Employee extends Person {
  final int employeeId;
  static int _employeeCnt = 0;
  static int get employeeCnt => _employeeCnt;
  Employee({
    required this.employeeId,
    required super.fname,
    required super.lname,
    required super.age,
  }) {
    print('\nEmployee hired!: ${super.fname} ${super.lname}');
    _employeeCnt += 1;
  }
}

void main() {
  final Employee emp0 = Employee(
    employeeId: 1001,
    fname: 'Kweayon',
    lname: 'Harshen-wuta',
    age: 31,
  );
  final Employee emp1 = Employee(
    employeeId: 1002,
    fname: 'Baki',
    lname: 'Hanma',
    age: 19,
  );
  final Employee emp2 = Employee(
    employeeId: 1003,
    fname: 'Gaara',
    lname: 'Sabaku',
    age: 15,
  );

  print('\nEmployee Count: ${Employee.employeeCnt}\n');
}
