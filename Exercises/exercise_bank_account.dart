class InsufficientFunds extends Error {
  final String message;

  InsufficientFunds([this.message = 'insufficient funds.']);

  @override
  String toString() => message;
}

abstract class BankAccount {
  void deposit(double depositAmount);

  void withdraw(double withdrawnAmount);
}

class CheckingsAccount extends BankAccount {
  double _balance;

  double get balance => _balance;

  CheckingsAccount({required double initialBalance}) : _balance = initialBalance;

  void deposit(double depositAmount) => _balance += depositAmount;

  void withdraw(double withdrawnAmount) => withdrawnAmount < _balance
      ? _balance -= withdrawnAmount
      : throw InsufficientFunds('the amount to be withdrawn: $withdrawnAmount exceeds the current balance of the account: $_balance.');
}

void main() {
  final account = CheckingsAccount(initialBalance: 10000);

  print(account.balance);

  account.deposit(5000);

  print(account.balance);

  account.withdraw(2000);

  print(account.balance);

  try {
    account.withdraw(14000);
  } catch (err, stackTrace) {
    print('ERROR: ${err.toString()}');
    print(stackTrace.toString());
  }
} 

  // Getter Method / Computed Variable

  //   - allows private variables to be read only (immutable) from outside the class structure
  //     and mutable inside the class structure

  //   - in the example abovewithdrawnAmount both the withdraw and deposit functions change the value of _balance