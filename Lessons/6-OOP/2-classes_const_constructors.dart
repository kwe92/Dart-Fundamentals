// const Constructors

//   - generates an immutable Object
//   - ALL member variables must be final

// immutable Object

class Employee {
  final String fname, lname;
  final double salary;

  const Employee({
    required this.fname,
    required this.lname,
    required this.salary,
  });

  // override toString method to print out Object
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
