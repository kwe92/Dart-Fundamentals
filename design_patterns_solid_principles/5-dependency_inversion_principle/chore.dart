// the only dependencies are abstractions (shared by the high level module)
import 'abstract_chore.dart';
import 'abstract_logger.dart';
import 'abstract_message_sender.dart';

class Chore extends AbstractChore {
  late final AbstractLogger _logger;

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
    required AbstractLogger logger,
    required AbstractMessageSender emailer,
  }) {
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
