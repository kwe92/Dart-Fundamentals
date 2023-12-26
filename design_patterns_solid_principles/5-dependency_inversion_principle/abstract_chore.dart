import 'abstract_maid.dart';
import 'abstract_owner.dart';

abstract class AbstractChore {
  final String chore;

  final AbstractMaid maid;

  final AbstractOwner owner;

  // implementation required in sub-class
  double get hoursWorked;

  // implementation required in sub-class
  bool get isComplete;

  AbstractChore({
    required this.maid,
    required this.chore,
    required this.owner,
  });

  // implementation required in sub-class
  void performedWork(double timeWorked);

  // implementation required in sub-class
  void completeChore();
}

// Abstract Classes Acting as Interfaces

//   - if defined method signatures and getter computed properties are not implemented 
//     within an Abstract Class, the sub-class must implement all of them via the @override annotation (Polymorphism)
