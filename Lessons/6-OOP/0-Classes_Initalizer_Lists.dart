// Classes Syntax: Intializer List
//    - Classes are the pillar of Object Oriented Programming
//    - Classes are like containers that hold data
//    - The containers encapsulate functionality that manipulates data held within

void main() {
  final BankAccount acct1 = BankAccount(acctHolder: 'Baki Hanma');

  print(acct1.balance);

  acct1.deposit(100000);

  print(acct1.balance);

  acct1.deposit(-1);
  acct1.withdraw(100001);

  print('${acct1.acctHolder} has a balance of: ${acct1.balance}');
}

class BankAccount {
  // Class Constructor using Initalizer Lists
  BankAccount({required String acctHolder, double balance = 0})
      : _balance = balance,
        acctHolder = acctHolder;
  // Creates a private member variable
  final String acctHolder;
  double _balance;
  double get balance => _balance;

  void deposit(double amt) => amt > 0 ? _balance += amt : print('Can not deposit a negative ammount: $amt.');

  void withdraw(var amt) => amt <= _balance ? _balance -= amt : print('Can not withdraw: $amt as it exceeds curtent balance of: $_balance');
}
