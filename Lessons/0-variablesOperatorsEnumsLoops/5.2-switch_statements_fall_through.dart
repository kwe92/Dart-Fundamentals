import 'dart:math';

enum ItemStatus {
  paid,
  ship,
  unpaid,
  notify;
}

void main() {
  final randomIndex = Random().nextInt(ItemStatus.values.length);

  final status = ItemStatus.values[randomIndex == 1 ? 0 : randomIndex];

  print(status);

  switch (status) {
    case ItemStatus.paid:
      executePaid();
      continue shipItem; //  non-sequential fallthrough continuing to shipItem label

    case ItemStatus.unpaid:
    case ItemStatus.notify:
      executeNotify();

    shipItem:
    case ItemStatus.ship:
      executeShip();
  }
}

void executePaid() => print('paid, closing and shipping.');
void executeShip() => print('package has been shipped.');
void executeNotify() => print('unpaid, notifying customer via email.');

// Switch statement - fall through

//  - empty cases fall through to the next case
//    giving case clauses the ability to share a body (block of code that will be executed)

//  - in most cases Logical OR is preferred at it more concise and readable

//      ~ e.g. case ItemStatus.unpaid || case ItemStatus.notify: ...
    
//  - use break in an empty case's body to prevent fall through

// Switch statement - non-sequential fallthrough

//   - execute different sections of a switch statement depending on the value passed

//   - use the continue statement and a label