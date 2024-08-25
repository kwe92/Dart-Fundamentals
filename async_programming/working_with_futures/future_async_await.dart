// TODO: Review
Future<int> main() async {
  // prefix function call with "await"
  print("Order started!");
  try {
    final order = fetchOrder();
    final order2 = fetchOrder2();
    final order3 = fetchOrder3();

    print(await order2);
    print(await order);
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

// Futures with async && await

// Future.delayed(Duration(seconds: 2), () => 'Vanilla Oat Milk Cold Brew');

// await

//   - await keyword to wait for a Future to be complete

//   - get the result value a Future returns

//   - only allowed in functions that have a function body prefixed with async

// Asynchronous Exception Handling

//   - there are two ways to handle execptions thrown by futures

//       - 1) traditional try, catch, and finally

//       - 2) using lower level methods of the future .then() try, .catchError() catch, and .whenComplete() finally

// async

//   - must prefix function bodies to allow the await keyword to work

// Using async && await

//   - A function prefixed with async awaiting an asynchronous operation
//     should have a return type of Future<data_type>

//   - prefix the function body with "async"

// Future.value and Future.error are good when writing unit tests and Future API's

//   - Future.value creates a future completed with the value passed
//     awaits if the value passed is a Future

// Async Function Summary

//   - functions marked with the async keyword become asynchronous functions, flaging the compiler to transform them changing their behavior:

//      - await expressions are transformed into returning a Future composed with then()

//      - return/throw statements are transformed into fulfilling/rejecting (respectively) that Future

//      - a function that returns by falling off the end of its body is transformed to fulfill its Future before doing so

//      - await can only be used inside an async function Dart statically checks this requirement
//        it will produce a static error if await occurs anywhere except inside an async function.