class Employee {
  //implicitly has a getter and setter method
  String? fname, lname;
  double? salary;

  // Getter derivation evaluating to a derivative field
  String? get email => '$fname.$lname@ayonInovations.net';

  // print string representation of Object
  @override
  String toString() => 'Employee(fname: $fname , lname: $lname, salary: $salary, email: $email)';
}

void main() {
  // implicitly initalize all member variables as null
  var emp1 = Employee();

  print('emp1: $emp1');

  // set each variable via cascading
  emp1
    ..fname = 'Kweayon'
    ..lname = 'Harshen-wuta'
    ..salary = 175000;

  print('emp1 after setting variables: $emp1');
}

// getter Methods (Derivation / Computed Field)

//   - special methods providing read access to:

//       - instance variables and computed variables (derived fields)

//   - generated implicitly for all instance vairables

//   - can be implemented explicitly to generate derived instance variables (computed variables) 

//   - computed variables can be derived from:

//       - other instance variables within the same class

//       - other parameters from another object (instance of a class)
//         such as a service object

//       - a function call

//   - getter methods are evaluated lazily

// setter Methods

//  - special methods providing write access to mutable member variables

//  - nullable and late instance variables that have not been initalized implicitly have setter methods

// Uniform Access Principle

//   - whether a property (field of a class) is computed or stored is an implementation detail

//   - getters are implemented implcitly and setters are implemented depending
//     on the constraints of the variable when it was declared
//     i.e. is the instance variable static, non-nullable, nullable, late, final, or const