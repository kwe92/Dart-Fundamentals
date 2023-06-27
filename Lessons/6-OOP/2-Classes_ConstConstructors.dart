// const Constructors

//   - generates an immutable Object
//   - ALL member variables must be final

// immutable Object

class Employee {
  final String fname, lname;
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

  @override
  String toString() => 'Employee(fname: ${this.fname}, lname: ${this.lname}, salary: ${this.salary})';
}

void main() {
  final emp1 = Employee(
    fname: 'Kweayon',
    lname: 'Harshen-Wuta',
    salary: 130000.00,
  );

  print(emp1);
}
