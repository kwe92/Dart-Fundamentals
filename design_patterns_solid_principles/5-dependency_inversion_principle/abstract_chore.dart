import 'abstract_maid.dart';
import 'abstract_owner.dart';

abstract class AbstractChore {
  final String chore;

  final AbstractMaid maid;

  final AbstractOwner owner;

  late double _hoursWorked;

  late bool _isComplete;

  double get hoursWorked => _hoursWorked;

  bool get isComplete => _isComplete;

  AbstractChore({
    required this.maid,
    required this.chore,
    required this.owner,
  });

  void performedWork(double timeWorked);

  void completeChore();
}

// Abstract Classes can act as interfaces if you do not implement the method signatures they define
