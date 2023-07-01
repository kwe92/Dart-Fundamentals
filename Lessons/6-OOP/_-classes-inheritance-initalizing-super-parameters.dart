// Inheriting Constructors

//     - super-class constructors CAN NOT be inherited
//     - You MUST implement the super-class constructor in the sub-class

// Implementating super-class constructor (Brevity)

//   - Implementing the super-class constructor is manditory
//   - you can use super.instanceVariable to initalize super-class parameters
//     this approach offers more brevity:
//       - removes the need to redeclare variables in the sub-class
//       - removes the need to use an initalizer list to initalize super parameters

class FictonalPerson {
  final String fname, lname;
  final age;

  const FictonalPerson({
    required this.fname,
    required this.lname,
    required this.age,
  });
}

class AnimeCharacter extends FictonalPerson {
  // no variables redefined
  const AnimeCharacter({
    required super.fname,
    required super.lname,
    required super.age,
  });
}

void main() {}
