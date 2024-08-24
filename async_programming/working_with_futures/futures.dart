// TODO: edit comments | review: https://web.mit.edu/6.031/www/sp22/classes/22-promises/#@model_concurrency_called

Future<String> fetchUserOrder() async => await Future.delayed(Duration(seconds: 2), () => throw Exception('Out of oat milk!'));

Future<String> fetchAnotherOrder() async => await Future.delayed(Duration(seconds: 4), () => 'Vanilla Oat Milk Cold Brew');

Future<String> fetchLongOrder() async => await Future.delayed(Duration(seconds: 10), () => 'Chai With Oat Milk');

Future<String> fetchFinalOrder() async => await Future.delayed(Duration(seconds: 3), () => 'Blueberry Miffin');

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

  print('I print after the fetchFinalOrder asynchronous computation completes because I am blocked by it!');

  return 0;
}

void _handleError(err) {
  print('$err');
}



// Future

//  - a "Future" represents the results of an asynchronous operation

//  - Futures are used to wait for an asynchronous operation to complete (blocking the flow of the program)
//    like fetching data from a database / api or reading from a file

//  - Futures that are non-blocking (omitting the await keyword) are treated as concurrent operations

// TODO: refactor in your own words

//  - To summarize, when you write async function instead of function, the compiler internally transforms the function’s behavior:

//      - await expressions are transformed into returning a promise composed with then();

//      - return/throw statements are transformed into fulfilling/rejecting (respectively) that promise

//      - a function that returns by falling off the end of its body is transformed to fulfill its promise before doing so

//      - Because the behavior of await depends on these transformations, await can only be used inside an async function

//       - Dart statically checks this requirement. It will produce a static error if await occurs anywhere except inside an async function.

// TODO: END

// TODO: What is Future.any do? Logical-OR for futures? review: Aggregating promises in 22-promises

// Future States

//   ~ a Future has three states:

//       + Pending (waiting for an asynchronous operation to complete)

//       + Complete (asynchronous operation completed with value)

//       + Rejected (throws an error)

// What is Future.delayed?

//   - a factory constructor for the future class

// .timeout()

//   - 

// .then()

//   - takes as an argument a callback whose parameter is the type of the asynchronous computation

//   - also produces a Future of the return type of the callback passed in

// TODO: refactor in your own words
//   - It helps to think about then as a composition operation for asynchronous computations. Conventional function composition takes two functions f and g and composes them into a new function g ⚬ f, such that (g ⚬ f)(x) = g(f(x)). If f: S → T and g: T → U, then the type of the resulting composition is g ⚬ f: S → U.

//   - In much the same way, then composes one computation f, represented by a promise of its return value Promise<T>, with another computation g that expects to consume that T value and produce a U value. The result of the composition is a combined computation that promises to eventually produce that U value, so its type is Promise<U>.

//   - You can call then as many times as you want on a promise, to attach different callbacks that might do different things with the promise’s value.

//   - then() is the only way to access the value that a promise computes

//??   - await actually uses then | is the previous statement true for Dart as well?

//   - then() is a feature of concurrency design. It allows a concurrent computation to be built up by a sequence of composed computations – a sequence of then() callbacks, which can be interleaved in controlled, predictable ways.
// TODO: END

//   - can be view as a composition operation for asynchronous computations (g ⚬ f)(x) == g(f(x)) executed right to left in set theory


// .catchError()

//   - takes as an argument a callback to handle any caught exception

//   - generally better to use at errors are propagated down the call stack


// .whenComplete()

//   - calls the passed in anonymous function

//   - When the asynchronous operation is complete regardless of outcome


