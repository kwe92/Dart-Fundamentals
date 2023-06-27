// getter

//   - special method providing read access to:
//       - member variables and computed variables
//   - generated implicitly for all member vairables

// setter

//  - special method, provides write access to mutable member variables
//  - non-final and late-final instance variables without initalizers implicitly have a setter method

// Nullable mutable Class
//   - constructor can be ommited

class Employee {
  // has implicit getter and setter methods
  String? fname, lname;
  double? salary;
  // computed variable
  String? get email => '$fname.$lname@ayonInovations.net';

  // print string representation of Object
  @override
  String toString() => 'Employee(fname: $fname , lname: $lname, salary: $salary, email: $email)';
}

void main() {
  // initally all member variables are null
  Employee emp1 = Employee();

  print('emp1: $emp1');

  // using the setter method for member variables
  emp1
    ..fname = 'Kweayon'
    ..lname = 'Harshen-wuta'
    ..salary = 175000;

  print('emp1 after setting variables: $emp1');
}
