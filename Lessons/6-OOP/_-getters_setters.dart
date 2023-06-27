// getter

//   - special method providing read access to:
//       - member variables and computed variables
//   - generated implicitly for member vairables
//   - a derivation process generating a derivative (computed variable)
//   - returns a primative or a combination of primatives and member variables
//   - final by default

// setter

//  - special method that provides write access to mutable member variables

// Nullable mutable Class
//   - constructor can be ommited

class Employee {
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
