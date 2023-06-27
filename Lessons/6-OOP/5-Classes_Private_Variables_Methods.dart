// Private variables && methods

// Prefix variable with leading underscore: _memberVariable

// Why use private member variables?

//    - encapsulates logic that should not be modified or accessed
//      outside of the class structure
//    - Allows member variables to be:
//          - Read-only outside of the class structure
//          - Read and write inside of the class structure
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
