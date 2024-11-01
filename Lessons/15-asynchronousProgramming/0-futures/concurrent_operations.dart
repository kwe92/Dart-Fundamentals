Future<void> main() async {
  double? total;

  var isComplete = false;

  final futureBalance = totalBalance();

  futureBalance.timeout(const Duration(seconds: 10))
    ..then<double>((val) => total = val)
    ..catchError((error) {
      print(error);
      return 0.0;
    })
    ..whenComplete(() {
      print(total);

      isComplete = true;
    });

  while (!isComplete) {
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

Future<double> totalBalance() async {
  print('starting concurrent operations...');

  // start asynchronous functions concurrently

  //   - immediately returning an uncomplete Future Object - (Non-Blocking main thread / isolate)

  //   - allowing execution to continue

  final checkingFuture = getBalance(AccountType.checking);

  final savingsFuture = getBalance(AccountType.savings);

  // wait for both Futures to complete and then do something with the results of each - in this case add them together
  final totalBalance = (await checkingFuture) + (await savingsFuture);

  print('concurrent operations complete...');

  return totalBalance;
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
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Concurrent Operations - Concurrency

//   - manage multiple instruction sequences at the same time

//   - rapidly switching between tasks and threads giving the illusion of
//     tasks happening simultaneously (context-switching)

//   - achieved through low-level time sharing (time slicing) operations
//     where the processor allocates small time slots to each task

//   - interleaved operations on a single processor

//   - the CPU rapidly switches between tasks

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Models of Concurrency

//   - concurrency models are about how concurrent operations communicate with one another

//   - there are two common models of concurrency:

//       - Shared Memory Model: 
//
//           - concurrent processes share memory space allowing them to read and write
//             to the same mutable objects sharing state

//       - Message Passing:

//           - concurrent processes do not share mutable state but instead pass messages to one another

//           - removing the complexities of synchronization mechinisms but at the cost of additional over head

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Concurrency in Dart

//   - concurrent programming in Dart refers to both asynchronous APIs (Future and Stream)
//     and Dart Isolates, which allow you to move processes to separate cores giving them there own
//     virutal isolated resources

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Threads - (Shared Memory Model)

//   - light weight unit of execution within a proccess

//   - threads share a proccesses memory space and resources

//   - threads can communicate and synchronize with each other through mechanisms such as
//     shared memory, locks and mutexes

//   - Threads have there own:

//       - program counter

//       - call stack

//       - local variables (private variabls)

//  - multiple threads on one processor are time sliced to give the illusion of parallelism

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Isolates - (Message Passing Model - Actor Model)

//   - all Dart code runs in isolates, which are similar to threads but have isolated memory
//     and their own event loop on a single thread

//   - isolates can only communicate by message passing and no global state is shared

//   - dart programs run in the main Isolate by default the entry point to a program and its set of instructions

//   - Isolates have there own:

//       - memory space

//       - call stack

//       - event loop

//       - local and global variables that can not be shared with other Isolates

//  - since Isolates use a shared memory concurrency model they do not have to worry
//    about the complexities of concurrent operation synchronization mechanisms
//    and race conditions are kept to a minimium


//   - Isolates are useful when you expect a synchronous operation to take a long time to complete
//     due to frame gaps which can freeze UI and cause animation jank

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Parallel Operations - Parallelism

//   - the simultaneous execution of concurrent tasks on multiple processors or cores

//   - running multiple instruction sequences at the same time

//   - multiple processors are doing work at the same time

// Futures with async && await

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Cooperative or Non-Preemptive Concurrency Model

//   - a simple concurrency model, deterministic in nature

//   - no scheduler (which can add complexity) to decide which task runs next, each task relinquishes control voluntrily

//   - threads are responsible for yeilding control

//   - typically runs on a single thread

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//  Understanding The Flow of Control in Asynchronous Operations Within a Cooperative Concurrency Model

//    - the mechanism for task switching is the voluntary relinquishment of control while a task is waiting

//    - callbacks are registered and called when an asynchronous operation completes (.then() or .whenComplete() methods)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// The Flow:

//   - Initial Task Execution: main loop starts executing a task

//   - Asynchronous Operation: the task starts an asynchronous operation that may take some time to complete

//   - Yielding Control: instead of blocking all other tasks the asynchronous operation yields control back to the main (isolate) loop / caller

//   - Main Loop Iterates: main loop / caller continues to execute other tasks

//   - Callback Trigger: When the asynchronous operation completes, it triggers a pre-registered callback function (.then() or .whenComplete())

//   - Callback Execution: The callback function is executed (.then() or .whenComplete()), allowing the task to handle the result of the asynchronous operation (e.g., processing the data read from the file).

//   - Returning to Task: The main loop returns control to the task that initiated the asynchronous operation, allowing it to resume execution

//   - This model of concurrency is called cooperative or non-preemptive model

//   - There is only one thread of control, and concurrent computations must cooperate to release control
//     to each other at well-defined points (such as await and return).

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Dart uses a Cooperative Concurrency Model for its Asynchronous Operations

//   - Single Thread of Execution: Dart uses a single thread of execution,
//     meaning that only one task can be actively running at a time

//   - Yielding Control: Asynchronous operations in Dart don't truly run concurrently in parallel instead,
//     they yield control back to the main thread (isolate) when they need to wait for something (like an I/O operation or a network request)

//   - Event Loop: Dart manages these asynchronous operations using an event loop
//     when an asynchronous operation completes,
//     it signals the event loop the event loop then schedules the completion callback
//     to be executed on the next available opportunity

//   - Cooperative Scheduling: It's up to the code to explicitly yield control to the event loop
//     using keywords like async, await, and yield
//     allowing the event loop to pick up other tasks while one is waiting