import 'dart:math';

enum ExecutableCommands {
  OPEN,
  CLOSED,
  PENDING,
  APPROVED,
  DENIED;
}

void main() {
  final commands = ExecutableCommands.values;

  for (var i = 0; i < commands.length; i++) {
    final int randInt = _randInt(commands.length);

    switch (commands[randInt]) {
      case ExecutableCommands.OPEN:
        executeOpen();
      case ExecutableCommands.CLOSED:
        executeClosed();
      case ExecutableCommands.PENDING:
        executePending();
      case ExecutableCommands.APPROVED:
        executeApproved();
      case ExecutableCommands.DENIED:
        executeDenied();
      default:
        executeUnknown();
    }
  }
}

int _randInt(int x) => Random().nextInt(x);

void executeOpen() => print('Status is open.');

void executeClosed() => print('Status is closed.');

void executePending() => print('Status is pending.');

void executeApproved() => print('Status is approved.');

void executeDenied() => print('Status is denied.');

void executeUnknown() => print('Status is unknown.');


// Default / Wildcard _ Clause

//   - used at the end of a switch statement when that value expression
//     does not match a case clause pattern