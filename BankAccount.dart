class BankAccount {
  BankAccount(this._balance);
  double _balance;
  // Getter Variable / Computer Variable
  //    - allows the private variable to be read only (immutable) from outside the class structure
  //      and mutable inside the class structure
  //      as both the withdraw and deposit functions change the value of _balance
  double get balance => _balance;

  void deposit(double d) => _balance += d;

  void withdraw(double w) {
    if (w < _balance) _balance -= w;
  }
}
