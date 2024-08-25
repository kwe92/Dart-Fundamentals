// TODO: review

Future<int> main() async {
  print('program has started!');

  // if await is omitted the asynchronous computations are none blocking - Concurrent - promise-based / future-based concurrency

  fetchUserOrder()
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

  final Future<double> change = fetchFinalOrder().then((order) => 2.50, onError: _handleError);

  print("Change for fetchFinalOrder: ${await change}");

  print('I print after the fetchFinalOrder asynchronous computation completes because I am blocked by its Promise!');

  return 0;
}

Future<String> fetchUserOrder() async => await Future.delayed(Duration(seconds: 2), () => throw Exception('Out of oat milk!'));

Future<String> fetchAnotherOrder() async => await Future.delayed(Duration(seconds: 4), () => 'Vanilla Oat Milk Cold Brew');

Future<String> fetchLongOrder() async => await Future.delayed(Duration(seconds: 10), () => 'Chai With Oat Milk');

Future<String> fetchFinalOrder() async => await Future.delayed(Duration(seconds: 3), () => 'Blueberry Miffin');

void _handleError(err) {
  print('$err');
}


//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Future

//   - a "Future" represents the result of an asynchronous operation

//   - Futures are used to wait for an asynchronous operation to complete (potentially blocking the flow of the program)
//     like fetching data from a database / api or reading from a file

//   - asynchronous functions that are non-blocking (omitting the await keyword) are treated as concurrent operations

//   - you can await the future instead of the asynchronous function to treat asynchronous operations as concurrent operations

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Future States

//   ~ a Future has three states:

//       + Pending (waiting for an asynchronous operation to complete)

//       + Complete (asynchronous operation completed with value)

//       + Rejected (throws an error)

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


