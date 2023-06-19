// final class modifier

//   - final classes:

//     - Prevents subtyping outside of its own library (module)
//     - Can be instantiated (constructed) in external libraries
//     - Can not be extended (inherited)
//     - Can not be implemented
//     - Sub-classes of a final class must be marked final, base or sealed

final class FinalEmployee {
  final String fname;
  final String lname;
  late double _salary;
  double get salary => _salary;
  FinalEmployee({
    required this.fname,
    required this.lname,
    required double salary,
  }) {
    this._salary = salary;
  }

  void giveRaise(double raisePct) =>
      raisePct <= 0.16 ? this._salary = this._salary + (this._salary * raisePct) : print('raise percent must not exceed 15%');
}

// Can be extended within its own library
base class ExtendedEmployee extends FinalEmployee {
  ExtendedEmployee({
    required super.fname,
    required super.lname,
    required super.salary,
  });
}

int main() {
  return 0;
}
