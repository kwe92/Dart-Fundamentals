class BankAccount {
  BankAccount(this._balance);
  double _balance;
  double get balance => _balance;

  void deposit(double d) => _balance += d;

  void withdraw(double w) {
    if (w < _balance) _balance -= w;
  }
}
