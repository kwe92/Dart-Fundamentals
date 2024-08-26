Future<void> main() async {
  double? total;

  final Future<double> futureBalance = totalBalance();

  futureBalance.timeout(const Duration(seconds: 10))
    ..then<double>((double val) => total = val)
    ..whenComplete(() => print(total));

  for (int i = 0; i < 10; i++) {
    await Future.delayed(const Duration(milliseconds: 500));
    total == null
        ? print('Doing other things on main thread while waiting for asynchronous operations to complete...')
        : print('Doing things on main thread after asynchronous operations are completed...');
  }
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
  print('starting concurrent operations...');

  // start asynchronous functions in parallel - Concurrently - immediately returning a Future Object - (Non-BLocking main thread)
  final Future<double> checkingFuture = getBalance(AccountType.checking);

  final Future<double> savingsFuture = getBalance(AccountType.savings);

  // wait for both Futures to complete and then do something with the results of each - in this case add them together
  final double totalBalance = (await checkingFuture) + (await savingsFuture);

  print('concurrent operations complete...');

  return totalBalance;
}

// Cooperative or Non-Preemptive Concurrency Model

//   - a simple concurrency model, deterministic in nature

//   - no scheduler (which can add complexity) to decide which task runs next, each task relinquishes control voluntrily

//   - threads are responsible for yeilding control

//   - typically runs on a single thread


//  Understanding The Flow of Control in Asynchronous Operations Within a Cooperative Concurrency Model

//    - the mechanism for task switching is the voluntary relinquishment of control while a task is waiting

//    - callbacks are registered and called when an asynchronous operation completes (.then() method)

// The Flow:

//   - Initial Task Execution: main loop starts executing a task.

//   - Asynchronous Operation: the task starts an asynchronous operation that may take some time to complete

//   - Yielding Control: instead of blocking all other tasks the asynchronous operation yields control back to the main loop / caller

//   - Main Loop Iterates: main loop / caller continues to execute other tasks

//   - Callback Trigger: When the asynchronous operation completes, it triggers a pre-registered callback function (.then())

//   - Callback Execution: The callback function is executed (.then()), allowing the task to handle the result of the asynchronous operation (e.g., processing the data read from the file).

//   - Returning to Task: The main loop returns control to the task that initiated the asynchronous operation, allowing it to resume execution.

//   - This model of concurrency is called cooperative or non-preemptive model

//   - There is only one thread of control, and concurrent computations must cooperate to release control
//     to each other at well-defined points (such as await and return).