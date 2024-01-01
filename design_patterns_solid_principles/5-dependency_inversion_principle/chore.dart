// the only dependencies are abstractions (shared by the high level module)
import 'abstract_chore.dart';
import 'abstract_logger.dart';
import 'abstract_message_sender.dart';

class Chore extends AbstractChore {
  // required implementations could have been instantiated here but instead we compose them by passing them into the constructor
  // remoiving the creation of objects, localizing them in one place, in our case the Factory Creational Design Pattern
  AbstractLogger? _logger;

  AbstractMessageSender? _emailer;

  double _hoursWorked = 0;

  bool _isComplete = false;

  @override
  double get hoursWorked => _hoursWorked;

  @override
  bool get isComplete => _isComplete;

  Chore({
    required super.chore,
    required super.maid,
    required super.owner,
    // pass internal required implementations as arguments instead of creating then within the class
    required AbstractLogger logger,
    required AbstractMessageSender emailer,
  }) {
    // initialize late variables that were defined and meant to be used internally
    _logger = logger;
    _emailer = emailer;
  }

  void performedWork(double timeWorked) {
    _hoursWorked += timeWorked;

    _logger!.log("performed $timeWorked hours of work task: $chore");
  }

  void completeChore() {
    _isComplete = true;

    _logger!.log("completed task: $chore");

    _emailer!.sendMessage(owner, "completed task: $chore");
  }
}
