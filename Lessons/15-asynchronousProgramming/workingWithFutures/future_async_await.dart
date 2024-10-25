//!! TODO: Review Comments and Edit them
Future<int> main() async {
  // prefix function call with "await"
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

//   - operations (functions) are executed sequentially, one after the other in the oder they were invoked

//   - synchronous operations are blocking, meaning no other operation can run until
//     the synchronous operation is complete

//   - due to the lack or parallelism synchronous operations can be a performance bottle next

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Asynchronous Programming

//   - a programming paradigm where operations can be executed without blocking the main thread or isolate
//     allowing it to move to another operation

//   - asynchronous operations can run concurrently or in parallel allowing other operations to be performed
//     while the asynchronous operation is executing

//   - asynchronous operations do have the option of blocking (pausing the programming) if their results are
//     required to proceed and no other actions can be taken through the use of  the 'await' keyword

//   - asynchronous operations in Dart return a Future, which is a concurrent process that will
//     return a value or throw an error in the Future  (similar to a Promise in JavaScript)

//   - there are multiple ways to retrieve the value of a Future once it has completed

//   - asnychronous computations can await for other asnychronous computations to complete
//     without blocking the main thread or isolate

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// async

//   - a keyword prefixing a function bodying turning the function
//     into an asynchronous operation

//   - asynchronous functions must return a Future<T> where T is the expected return value

//    - asynchronous functions that produce a side-effect typically return Future<void>

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