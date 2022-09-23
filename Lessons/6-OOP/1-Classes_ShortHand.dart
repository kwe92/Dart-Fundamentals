// Classes Syntax: Short Hand this. also seen as self. in other languages
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

  final BankAccount acct2 =
      BankAccount(acctHolder: 'Alphonse Elric', balance: 300000);

  acct1.deposit(100000);

  print(acct2.balance);

  acct2.deposit(-20);
  acct2.withdraw(2000);

  print('${acct2.acctHolder} has a balance of: \$${acct2.balance}');
}

class BankAccount {
  BankAccount({required this.acctHolder, this.balance = 0});
  // Creates a private member variable
  final String acctHolder;
  double balance;

  void deposit(double amt) {
    if (amt > 0)
      balance += amt;
    else
      print('Can not deposit a negative ammount: \$$amt.');
  }

  void withdraw(final amt) {
    if (amt <= balance) {
      balance -= amt;
      print('Withdrawal of \$$amt was successful.'
          '\n'
          'Remaining balance:\$$balance');
    } else {
      print(
          'Can not withdraw: \$$amt as it exceeds curtent balance of: \$$balance');
    }
  }
}
