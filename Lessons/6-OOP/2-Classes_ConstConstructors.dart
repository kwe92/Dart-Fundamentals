// const Constructors

//   - generates an immutable Object
//   - ALL member variables must be final

// immutable Object

class Employee {
  final String fname;
  final String lname;
  final double salary;

  // getter

  //   - a derivation process that generates a derivative
  //   - can be a primative or a combination of primatives and member variables
  //   - final by default

  String get email => '@ayonInovations.net';

  const Employee({
    required this.fname,
    required this.lname,
    required this.salary,
  });
}

void main() {}
