abstract interface class Employee {
  abstract final String fName;

  abstract final String lName;

  String get email;

  int get salary;

  String fullName();
}

mixin SoftwareEngineer implements Employee {
  abstract final Set<String> programmingLanguages;
}

class FullStackEngineer with SoftwareEngineer {
  final String fName;

  final String lName;

  final int salary;

  final Set<String> programmingLanguages;

  @override
  String get email => '$fName$lName@ayon.io';

  FullStackEngineer({
    required this.fName,
    required this.lName,
    required this.salary,
    required this.programmingLanguages,
  });

  @override
  String fullName() => '$fName $lName';

  @override
  String toString() {
    return 'FullStackEngineer(fName: $fName, lName: $lName, salary: $salary, programmingLanguages: $programmingLanguages)';
  }
}

void main() {
  final softwareEngineer = FullStackEngineer(
    fName: 'Kweayon',
    lName: 'Clark',
    salary: 130000,
    programmingLanguages: {'python, JavaScript', 'TypeScript', 'HTML', 'CSS', 'Dart', 'GO', 'SQL'},
  );

  print(softwareEngineer);

  print(softwareEngineer.email);
}
// Abstract Fields

//   - there are a few ways to enforce the initialization of abstract
//     fields when an interface is being implemented

//   - mark the fields as abstract, forcing them to be declared and initialized

//   - declare a getter on the field forcing the field to be initialized

//   - when a field is declared as abstract it does not need initialization
//     by a generative constructor within the abstract class

//   - sub-classes can initialize the field in one of the three known ways
//     or override the getter on the required fields that need to be implemented
//     the @override annotation can be omitted

//   - required fields can be derived or initialized

// Specify Members a mixin Can Call on Itself

//   - a mixin can not inherit from a sub-class but it can implement an interface
//     forcing any sub-classes to implement any abstract memebers