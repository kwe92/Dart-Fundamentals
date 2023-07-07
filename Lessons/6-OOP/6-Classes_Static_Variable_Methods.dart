// Class Variables - Static Variables

//   - class wide state and constant variables
//   - can be accessed by instances
//     if a getter is defined but all instance
//     will share the Class variable

// Static Methods

//   - static methods are specific to the class itself
//   - useful for created namespaces for a collection
//     of related methods
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
  int get getStaticVariable => _employeeCnt;

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

  print('\nStatic variable access via Class: ${Employee.employeeCnt}\n');
  print('Static variable accessed via getter for instance: ${emp0.getStaticVariable}\n');

// Accessing a static method without an instance getter
// will result in a compile-time error

// emp0.employeeCnt
}
