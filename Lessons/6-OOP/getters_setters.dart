// getter (Derivation / Computed)

//   - special method providing read access to:
//       - member variables and computed variables

//   - generated implicitly for all public member vairables

// setter

//  - special method, provides write access to mutable member variables

//  - nullable and late instance variables that have not been initalized implicitly have setter methods

// Nullable mutable Class

//   - constructor can be ommited

class Employee {
  //implicitly has a getter and setter method
  String? fname, lname;
  double? salary;

  // derivation
  String? get email => '$fname.$lname@ayonInovations.net';

  // print string representation of Object
  @override
  String toString() => 'Employee(fname: $fname , lname: $lname, salary: $salary, email: $email)';
}

void main() {
  // implicitly initalize all member variables as Null
  Employee emp1 = Employee();

  print('emp1: $emp1');

  // set each variable via cascading
  emp1
    ..fname = 'Kweayon'
    ..lname = 'Harshen-wuta'
    ..salary = 175000;

  print('emp1 after setting variables: $emp1');
}
