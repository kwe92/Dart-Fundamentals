Future<void> main() async {
  double? total;

  // determines if the asnychronous operation is complete or not
  var isComplete = false;

  // start non-blocking asnychronous operation, yeidling control to Event Loop
  final futureBalance = totalBalance();

  // register callbacks associated with the asynchronous event
  // to be triggered when when the event loop is notified of the asynchronous events completion
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

/// Simulate retrieving data from an account server.
Future<double> getBalance(AccountType accountType) async {
  switch (accountType) {
    case AccountType.checking:
      print('retrieving checking account balance...');
      await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
      print('retrieved checking account balance.');
      return 200.00;

    case AccountType.savings:
      print('retrieving savings account balance...');
      await Future.delayed(const Duration(seconds: 2, milliseconds: 500));
      print('retrieved savings account balance.');

      return 16000.00;
  }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Concurrent Operations - Concurrency

//   - manage multiple instruction sequences (tasks) at the same time

//   - the CPU rapidly switches between tasks and threads or cores giving the illusion of
//     tasks happening simultaneously (context-switching)

//   - achieved through low-level time sharing (time slicing) operations
//     where the processor allocates small time slots to each task on a thread of a core

//   - interleaved operations on a single processor

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Models of Concurrency

//   - concurrency models are about how concurrent operations communicate with one another

//   - there are two common models of concurrency:

//       - Shared Memory Model: 
//
//           - concurrent processes share memory space (sharing state) allowing them to read and write
//             to the same mutable objects

//           - threads share the memory space of the process they are running in so they are
//             inherently setup for the Shared Memory Model for concurrency

//           - the shared memory model adds the complexity of synchronization mechanisms and race conditions
//             at the benifit of being potentially faster and applications that share and mutate large amounts of data
//             typically benefit from the shared memory model

//       - Message Passing Model:

//           - concurrent processes do not share mutable state but instead pass messages to one another

//           - removing the complexities of synchronization mechinisms but at the cost of additional over head
//             when dealing with large sets of data that will be modified as data is typically copied

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Concurrency in Dart

//   - concurrent programming in Dart refers to both asynchronous APIs (Future and Stream)
//     and Dart Isolates, which allow you to move processes to separate cores giving them there own
//     virutal isolated resources (Message Passing Model)

//   - Dart uses a message passing concurrency model when needing to execute tasks on another
//     event loop / thread or core

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Parallel Operations - Parallelism

//   - while concurrency is about managing multiple tasks parallelism is about executing multiple tasks simultaneously

//   - the simultaneous execution of concurrent tasks on multiple processors or cores

//   - running multiple instruction sequences at the same time

//   - multiple processors are doing work at the same time

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Threads - (Shared Memory Model)

//   - light weight units of execution within a proccess

//   - threads share a proccesses memory space and resources

//   - threads can communicate and synchronize with each other through mechanisms such as
//     shared memory, locks and mutexes

//   - Threads have their own:

//       - program counter

//       - call stack

//       - local variables (private variables)

//  - multiple threads within a single processor are time sliced to give the illusion of parallelism
//    when executing tasks simultaneously

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Isolates - (Message Passing Model - Actor Model)

//   - Isolates have their own independent execution environments

//   - all Dart code runs in isolates, which are similar to threads but have isolated memory
//     and their own event loop on a single thread

//   - isolates can only communicate by message passing and no global state is shared

//   - dart programs run within the main Isolate by default
//     triggered by the main function serving as the entry point to a Dart program

//   - Isolates have their own:

//       - memory space

//       - call stack

//       - event loop

//       - local and global variables that can not be shared with other Isolates

//  - since Isolates use a message passing concurrency model they do not have to worry
//    about the complexities of concurrent operation synchronization mechanisms
//    and race conditions are kept to a minimium

//   - Isolates are useful when you expect a synchronous operation to take a long time to complete
//     due to frame gaps which can freeze UI and cause animation jank

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Cooperative or Non-Preemptive Concurrency Model

//   - a simple concurrency model, deterministic in nature

//   - no scheduler (which can add complexity) to decide which task runs next, each task relinquishes control voluntarily

//   - threads are responsible for yeilding control

//   - typically runs on a single thread

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//  Understanding The Flow of Control in Asynchronous Operations Within a Cooperative Concurrency Model

//    - the mechanism for task switching is the voluntary relinquishment of control while a task is waiting

//    - callbacks are registered and called when an asynchronous operation completes (.then() or .whenComplete() methods)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// The Asynchronous Task Event Loop Flow:

//   - Initial Task Execution:

//       - main loop starts executing a task

//   - Asynchronous Operation:

//       - the task starts an asynchronous operation that may take some time to complete

//   - Yielding Control:

//       - instead of blocking all other tasks the asynchronous operation yields control back to the main (isolate) loop / caller

//   - Main Loop Iterates:

//       - event loop continues to execute other tasks

//   - Callback Trigger and Execution:

//       - when asynchronous operations complete, pre-registered callback functions are triggered and executed (e.g. .then() or .whenComplete())
//         the calback handles the result of the asynchronous operation (e.g., processing the data read from the file)

//   - Returning to Task:

//       - the event loop returns control to the task that initiated the asynchronous operation, allowing it to resume execution

//   - this model of concurrency is called cooperative or non-preemptive model

//   - there is only one thread of control, and concurrent computations must cooperate to release control
//     to each other at well-defined points (such as await and return).

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Dart uses a Cooperative Concurrency Model for its Asynchronous Operations

//   - Single Thread of Execution:

//       - Dart uses a single thread of execution,
//         meaning that only one task can be actively running at a time

//   - Yielding Control:

//       - asynchronous operations in Dart don't truly run concurrently in parallel instead,
//         they yield control back to the main thread (isolate) when they need to wait for something (like an I/O operation or a network request)

//   - Event Loop:

//       - Dart manages these asynchronous operations using an event loop and event queue when an asynchronous operation completes,
//         it signals the event loop which then schedules the registered callbacks
//         to be executed on the next available opportunity

//   - Cooperative Scheduling:

//       - it's up to the code to explicitly yield control to the event loop
//         using keywords like async, await, and yield allowing the event loop to pick up other tasks while one is waiting