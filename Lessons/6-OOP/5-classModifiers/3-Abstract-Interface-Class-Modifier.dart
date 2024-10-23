abstract interface class EmployeeAbstractInterface {
  final String fname;
  final String lname;
  late double _salary;

  String get email => '${fname.substring(0, 1) + lname}@ayonInnovations.io';
  double get salary => this._salary;

  EmployeeAbstractInterface({
    required this.fname,
    required this.lname,
    required double salary,
  }) {
    this._salary = salary;
  }

  void raise(double raisePct);
}

class DataEngineer extends EmployeeAbstractInterface {
  final List<String> progLang;
  DataEngineer({
    required super.fname,
    required super.lname,
    required super.salary,
    required this.progLang,
  });

  @override
  void raise(double raisePct) => raisePct < 0.16 ? this._salary = this._salary + (this._salary * raisePct) : throw InvalidSalaryError();
}

class InvalidSalaryError extends Error {
  InvalidSalaryError();

  @override
  String toString() => 'Invalid raisePct: raisePct < 0.16';
}

void main() {
  final DataEngineer dataEngineerI = DataEngineer(fname: 'Baki', lname: 'Hanma', salary: 115000, progLang: <String>['SQL', 'Python']);

  print(dataEngineerI.email + '\n');

  print('Before raise: ${dataEngineerI.salary} \n');

  dataEngineerI.raise(0.12);

  print('After raise: ${dataEngineerI.salary} \n');

  try {
    dataEngineerI.raise(0.16);
  } catch (errorMessage, stackTrace) {
    print('Error Message:\n\n $errorMessage\n');
    print('Stack Trace:\n\n $stackTrace');
  } finally {
    print('Keep it pushing king!');
  }
}


// Combining Class Modifiers - Group Theory

//   - Class modifiers can be combined to create new class modifiers

// Abstract Interface Class - Pure Interface

//   - Combines the class modifiers: abstract && interface

//   - Creates a new pure interface

// Pure Interface

//   - Can not be instantiated (constructed) at all

//   - Can not be extended outside of its own library

//   - Can be implemented outside of its own library