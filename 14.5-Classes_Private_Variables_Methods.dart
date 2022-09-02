// Private variables and methods
// Prefix the variable with a leading underscore
// see the BankAccount.dart File

import 'BankAccount.dart';

void main() {
  final BankAccount acct1 = BankAccount(100);
  print(acct1.balance);
  acct1.deposit(200);
  print(acct1.balance);

  // There is no setter for the .balance so it is immutable
  // acct1.balance = 200;

// Can not access private variables
// acct1._balance;
}
