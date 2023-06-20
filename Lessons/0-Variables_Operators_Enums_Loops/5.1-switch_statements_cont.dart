import 'dart:math';

void executeOpen() => print('Status is open');

void executeClosed() => print('Status is closed');

void executePending() => print('Status is pending');

void executeApproved() => print('Status is approved');

void executeDenied() => print('Status is denied');

void executeUnknown() => print('Status is unknown');

int _randInt(int x) => Random().nextInt(x);

void main() {
  const List<String> commands = [
    'OPEN',
    'CLOSED',
    'PENDING',
    'APPROVED',
    'DENIED',
  ];

  final int len = commands.length;

  for (var i = 0; i < len; i++) {
    final int randInt = _randInt(len);

    switch (commands[randInt]) {
      case 'OPEN':
        executeOpen();
      case 'CLOSED':
        executeClosed();
      case 'PENDING':
        executePending();
      case 'APPROVED':
        executeApproved();
      case 'DENIED':
        executeDenied();
      default:
        executeUnknown();
    }
  }
}
