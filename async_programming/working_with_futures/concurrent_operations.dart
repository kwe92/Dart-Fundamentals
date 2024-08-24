// TODO: review https://web.mit.edu/6.031/www/sp22/classes/22-promises/ | start here: Suppose a client calls totalBalance(). Here’s what happens:

void main() {
  totalBalance();
}

enum AccountType {
  checking,
  savings,
}

Future<double> getBalance(AccountType accountType) async {
  switch (accountType) {
    case AccountType.checking:
      print('retrieving checking account balance.');
      await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
      print('retrieved checking account balance.');
      return 200.00;

    case AccountType.savings:
      print('retrieving savings account balance.');
      await Future.delayed(const Duration(seconds: 2, milliseconds: 500));
      print('retrieved savings account balance.');

      return 16000.00;
  }
}

Future<double> totalBalance() async {
  // start asynchronous functions in parallel - Concurrently - immediately returning a Future Object
  final Future<double> checkingPromise = getBalance(AccountType.checking);

  final Future<double> savingsPromise = getBalance(AccountType.savings);

  // wait for both of the asynchronous functions to complete and then do something with the results of each - in this case add them together
  return (await checkingPromise) + (await savingsPromise);
}
// TODO: add notes on placing await keyword in different places

// TODO: explain the cooperative or non-preemptive model of concurrency | what are other concurrency models?

// TODO: understand the flow of control of asynchronous operations

// TODO: how many threads does dart / flutter use for concurrent operations?

// This model of concurrency is called cooperative or non-preemptive. There is only one thread of control, and concurrent computations must cooperate to release control to each other at well-defined points (such as await and return).