// Switch statement - fall through

//   - empty cases fall through to the next case
//       - use break in an empty case's body to prevent fall through

// Switch statement - non-sequential fallthrough

//   - execute different sections of a switch statement depending on the value passed
//   - use the continue statement and a label

void executePaid() => print('paid, closing and shipping.');
void executeShip() => print('package has been shipped.');
void executeNotify() => print('unpaid, notifying customer via email.');

void main() {
  final List<String> status = [
    'PAID',
    'SHIP',
    'UNPAID',
    'NOTIFY',
  ];

  switch (status[0]) {
    case 'PAID':
      executePaid();
      continue shipItem;
    shipItem:
    case 'SHIP':
      executeShip();
    case 'UNPAID':
    case 'NOTIFY':
      executeNotify();
  }
}
