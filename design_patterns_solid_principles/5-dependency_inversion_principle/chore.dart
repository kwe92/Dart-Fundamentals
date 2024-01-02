// the only dependencies are abstractions (shared by high level and low level modules)
import 'abstract_chore.dart';
import 'abstract_logger.dart';
import 'abstract_message_sender.dart';

class Chore extends AbstractChore {
  // private variable, instantiated within constructor body
  late final AbstractLogger _logger;

  // private variable, instantiated within constructor body
  late final AbstractMessageSender _emailer;

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
    // initialize late variables that were defined and meant to be used internally (privately)
    _logger = logger;
    _emailer = emailer;
  }

  void performedWork(double timeWorked) {
    _hoursWorked += timeWorked;

    _logger.log("performed $timeWorked hours of work task: $chore");
  }

  void completeChore() {
    _isComplete = true;

    _logger.log("completed task: $chore");

    _emailer.sendMessage(owner, "completed task: $chore");
  }
}

// Composing Objects Instead of Internal Creation

//   - instead of instantiating (creating) object internally they are composed
//     by being passed into the constructor as arguments, localizing the creation
//     of objects in one place, in our case the Factory Static Class (Creational Design Pattern)
//   - this process removes concrete dependencies if an abstraction (interface / abstract class) is defined

