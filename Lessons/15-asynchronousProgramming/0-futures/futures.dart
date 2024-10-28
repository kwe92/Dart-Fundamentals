//!! TODO: Review Comments and Edit them

Future<void> main() async {
  print('program has started!');

  // if await is omitted the asynchronous computations are none blocking - Concurrent - promise-based / future-based concurrency

  final uncompletedFutureOrder = fetchUserOrder();

  uncompletedFutureOrder
      .then((order) => print('Order is ready: $order'))
      .catchError(_handleError)
      .whenComplete(() => print('First Order Completed Order!'));

  fetchAnotherOrder()
      .then((order) => print('Order is ready: $order'))
      .catchError((err) => _handleError)
      .whenComplete(() => print('Second Order Completed Order!'));

  fetchLongOrder()
      .timeout(const Duration(seconds: 6))
      .then((order) => print('Order is ready: $order'))
      .catchError(_handleError)
      .whenComplete(() => print('Third Order Completed Order!'));

  print('I print before the asynchronous computations complete because I am not blocked by them!');

  final change = fetchFinalOrder().then((order) => 2.50, onError: _handleError);

  print("Change for fetchFinalOrder: ${await change}");

  print('I print after the fetchFinalOrder asynchronous computation completes because I am blocked by its Promise!');
}

Future<String> fetchUserOrder() async => await Future.delayed(Duration(seconds: 2), () => throw Exception('Out of oat milk!'));

Future<String> fetchAnotherOrder() async => await Future.delayed(Duration(seconds: 4), () => 'Vanilla Oat Milk Cold Brew');

Future<String> fetchLongOrder() async => await Future.delayed(Duration(seconds: 10), () => 'Chai With Oat Milk');

Future<String> fetchFinalOrder() async => await Future.delayed(Duration(seconds: 3), () => 'Blueberry Miffin');

void _handleError(err) {
  throw err;
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Future

//   - a "Future" represents a concurrent operation (asynchronous operation) that will eventually finish with a result or an error

//   - if you do not await a returned Future, an instance of a Future is returned in an uncompleted state

//   - Futures are used to wait for an asynchronous operation to complete (potentially blocking the flow of the program)
//     like fetching data from a database / api or reading from a file

//   - asynchronous operations returning a Future starts the concurrent operation and immediately returns an uncomplete Future
//     allowing other code to execute while the Future is processing

//   - asynchronous functions that are non-blocking (omitting the await keyword) are treated as concurrent operations
//     returning an uncompleted Future, which can use the Future API's part of the future instance to monitor the state of the Future
//     or be awaited later in the programs execution to return the Futures value or error

//   - you can await the uncompleted future instead of the asynchronous function
//     and invoke multiple Futures concurrently or do some synchronous work before awaiting

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Accessing The Result of a Future

//   - the result of a future can be accessed in two ways:

//       - the await keyword prefixing an uncompleted Future

//       - using the Future API low level functions (await and aasync are built on top of the Future API)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// The Future API

//   - access the results of a Future by registering callbacks to handle
//     what a Future returns and what to do if the future completes with a result or an error

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Future States

//   ~ a Future has three states:

//       + Pending / Uncompleted (waiting for an asynchronous operation to finish or throw an error)

//       + Completed (asynchronous operation completed with a value or error)

//       + Rejected (throws an error / future completed with an error)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// What is Future.delayed?

//   - a factory constructor for the future class that adds a delay before a future completes

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// .timeout()

//   - stop waiting for a future after the specified time has passed

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// .then() (try)

//   - takes as an argument a callback whose parameter is the type of the asynchronous computation

//   - also produces a Future of the return type of the callback passed in

//   - what await uses under the hood to compose asynchronous operations

//   - you do not have to return the type T of the object in the callback to .then
//     you can return whatever you want an the resulting Future value does not have to be used
//     what matters is the type argument to the Future parametered type when the variable is
//     declared if the result is passed to a variable

//   - if the result is not passed to a variable then you can do some side effect within the callback
//     passed to the .then API

//   - it helps to think about .then() as a composition operation for asynchronous computations
//     conventional function composition takes two functions
//     f and g and composes them into a new function g ⚬ f,such that (g ⚬ f)(x) = g(f(x))
//     if f: S → T and g: T → U, then the type of the resulting composition is g ⚬ f: S → U.

//   - in much the same way, then composes one computation f
//     represented by a Future of its return value Future<T>
//     with another computation g that expects to consume that T value and produce a U value
//     the result of the composition is a combined computation that promises to eventually produce that future U value
//     so its type is Future<U>.

//   - you can call then as many times as you want on a Future
//     to attach different callbacks that might do different things with the Future's value.

//   - then() is the only way to access the value that a Future computes

//   - then() is a feature of concurrency design allowing a concurrent computation to be built up
//     by a sequence of composed computations – a sequence of then() callbacks
//     which can be interleaved in controlled, predictable ways.

//   - can be view as a composition operation for asynchronous computations (g ⚬ f)(x) == g(f(x)) executed right to left in set theory

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// .catchError() (catch)

//   - takes as an argument a callback to handle any caught exception

//   - generally better to use at errors are propagated down the call stack

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// .whenComplete() (finally)

//   - calls the passed in anonymous function

//   - When the asynchronous operation is complete regardless of outcome
