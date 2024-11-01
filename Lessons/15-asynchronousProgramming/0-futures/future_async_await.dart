Future<int> main() async {
  print("Order started!");

  try {
    final order = fetchOrder();

    final order2 = fetchOrder2();

    final order3 = fetchOrder3();

    print(await order);

    print(await order2);

    print(await order3);
  } catch (error) {
    print(error);
  } finally {
    print("Completed Order!");
  }
  return 0;
}

Future<String> fetchOrder() async => await Future.delayed(Duration(seconds: 2), () => "Out of oat milk!");

Future<String> fetchOrder2() async => await Future.value("Have a tea!");

Future<String> fetchOrder3() async {
  await Future.delayed(Duration(seconds: 4));

  return await Future.error(throw Exception("out of green tea!"));
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Synchronous Programming

//   - operations (functions) are executed sequentially, one after the other in the order they were invoked

//   - synchronous operations are blocking, meaning no other operation can run until
//     the synchronous operation is complete

//   - due to the lack or parallelism synchronous operations can be a performance bottle neck

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Asynchronous Programming

//   - a programming paradigm where operations can be executed without blocking the main thread or isolate
//     allowing it to move to another operation

//   - asynchronous operations can run concurrently or in parallel allowing other operations to be performed
//     while the asynchronous operation is executing

//   - asynchronous operations do have the option of blocking (pausing the programming) if their results are
//     required to proceed and no other actions can be taken through the use of  the 'await' keyword

//   - asynchronous operations in Dart return a Future, which notifies the Event Queue once it completes
//     returning a value or throw an error in the Future (similar to a Promise in JavaScript)

//   - there are multiple ways to retrieve the value of a Future once it has completed

//   - asnychronous computations can await for other asnychronous computations to complete
//     without blocking the main thread or Isolate

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Event Loop

//   - the model in which Darts runtime is based on

//   - the event loop executes your programs code one instruction at a time
//     in the order in which the operations were queued

//   - it also manages events and notifications

//   - the Event Loop monitors the Event Queue where all of your events are stored


//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Event Handling

//   - events are handled by the Event Loop removing events from the Event Queue in first-int, first-out order

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


// Asynchronous Operations and The Event Loop

//   - in Dart asynchronous operations are asynchronous events that are managed by the Event Loop
//     within the Isolate that they were called in

//   - the Event Loop has an Event Queue with a notification mechinism to execute the callbacks associated with
//     an asynchronous event upon being notified of its completion (e.g. then() or whenComplete() part of the Future API)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Asynchronous Operation Completion and The Event Queue

//   - when a notification associated with an asynchrnous event is removed from the Event Queue
//     the corresponding Event Object is retreived along with any callbacks that need to be
//     executed on that object by the Event Loop

// step 1:

//   - Notification Arrives:

//       - when an asynchronous operation completes, a notification is placed in the event queue
//         This notification signals that the asynchronous operation is finished and ready to be processed

// step 2:

//   - Event Loop Retrieves Notification:

//       - the event loop constantly monitors the event queue
//         When it encounters a notification, it retrieves it from the queue

// step 3:

//   - Event Object Retrieval:

//       - associated with the notification is the asynchronous event object
//         the event loop retrieves this object, which contains
//         the result or data related to the completed asynchronous operation

// step 4:

//   - Callback Retrieval:

//       - also linked to the notification are any callback functions (closures)
//         that were registered when the asynchronous operation was initiated
//         these callbacks specify what actions should be taken when the operation completes

//       - e.g. then(), catchError(), whenComplete(), etc

//       - callbacks are stored in a callback registery and retrieved by the event Loop

// step 5:

//   - Callback Execution:

//       - the event loop executes the retrieved callbacks, passing the event object as an argument
//         this allows the callbacks to access the result or data related to the asynchronous operation
//         and perform the necessary actions

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// async

//   - a keyword prefixing a function bodying turning the function
//     into an asynchronous operation

//   - asynchronous functions must return a Future<T> where T is the expected return value

//   - asynchronous functions that produce a side-effect typically return Future<void>

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// await

//   - blocks program execution until an uncompleted Future completes with a value or an error

//   - if a vuture completes with an error the error is rethrown

//   - only works in asynchronous functions (function with a async keyword prefixing their body)

//   - can be placed before a function returning an uncompleted future
//     or before the reference to an uncompleted Future

//   - await seems to be a short hand syntax for futureInstance.then((value)=> value).onError((err)=> throw Err)
//     with the added functionality to pause execution

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Asynchronous Exception Handling

//   - there are two ways to handle execptions thrown by futures

//       - 1) traditional try, catch, and finally

//       - 2) low level API's of the Future class:

//              - futureInstance.then() try

//              - futureInstance.catchError() catch

//              - futureInstance.whenComplete() finally

//   - if a Future returns with an error and is not handled in one of the two
//     ways specified above the error is forwarded to the global error handler as
//     an uncaught exception as to not silently drop any errors, and will most likely
//     terminate the execution of your program

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Using async && await

//   - A function prefixed with async awaiting an asynchronous operation
//     should have a return type of Future<data_type>

//   - prefix the function body with "async"

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Future.value and Future.error

//   - useful when writing unit tests and Future API's

//   - Future.value creates a future completed with the value passed
//     awaits if the value passed is a Future

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Async Function Summary

//   - functions marked with the async keyword become asynchronous operations
//     flaging the compiler to transform them changing their behavior:

//      - await expressions block execution until the Future is complete

//      - return/throw statements are transformed into fulfilling/rejecting (respectively) that Future

//      - a function that returns by falling off the end of its body is transformed to fulfill its Future before doing so

//      - await can only be used inside an asynchronous functions Dart statically checks this requirement
//        it will produce a static error if await occurs anywhere except inside an async function