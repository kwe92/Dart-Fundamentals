Future<String> fetchUserOrder() async => await Future.delayed(Duration(seconds: 2), () => throw Exception('Out of oat milk!'));

Future<String> fetchAnotherOrder() async => await Future.delayed(Duration(seconds: 4), () => 'Vanilla Oat Milk Cold Brew');

Future<String> fetchLongOrder() async => await Future.delayed(Duration(seconds: 10), () => 'Chai With Oat Milk');

Future<String> fetchFinalOrder() async => await Future.delayed(Duration(seconds: 3), () => 'Blueberry Miffin');

Future<int> main() async {
  print('program has started!');

  // if await is omitted the asynchronous computations are none blocking - Concurrent - promise-based / future-based concurrency

  fetchUserOrder()
      .then((order) => print('Order is ready: $order'))
      .catchError((err) => print('fetchUserOrder: $err'))
      .whenComplete(() => print('First Order Completed Order!'));

  fetchAnotherOrder()
      .then((order) => print('Order is ready: $order'))
      .catchError((err) => print('fetchAnotherOrder: $err'))
      .whenComplete(() => print('Second Order Completed Order!'));

  fetchLongOrder()
      .timeout(const Duration(seconds: 6))
      .then((order) => print('Order is ready: $order'))
      .catchError((err) => print('fetchLongOrder: $err'))
      .whenComplete(() => print('Third Order Completed Order!'));

  print('I print before the asynchronous computations complete because I am not blocked by them!');

  await fetchFinalOrder()
      .then((order) => print('Order is ready: $order'))
      .catchError((err) => print('fetchAnotherOrder: $err'))
      .whenComplete(() => print('fourth Order Completed Order!'));

  print('I print after the fourth asynchronous computation completes because I am blocked by it!');

  return 0;
}


// TODO: edit comments

// Future

//  - a "Future" represents the results of an asynchronous operation

//  - Futures are used to wait for an asynchronous operation to complete (blocking the flow of the program)
//    like fetching data from a database / api or reading from a file

//  - Futures that are non-blocking (omitting the await keyword) are treated as concurrent operations

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

// .catchError()

//   - takes as an argument a callback to handle any caught exception

//   - generally better to use at errors are propagated down the call stack


// .whenComplete()

//   - calls the passed in anonymous function

//   - When the asynchronous operation is complete regardless of outcome
