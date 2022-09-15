// Futures with async && await

// Future.delayed(Duration(seconds: 2), () => 'Vanilla Oat Milk Cold Brew');

// await
//  - await keyword to wait for a Future to be complete
//  - get the result value a Future returns
//  - only allowed in functions that have a function body prefixed with async

// Asynchronous Exception Handling
//  - use try catch finally with asynchronous functions to hand exceptions
//    thrown by a future

// async
//  - must prefix function bodies to allow the await keyword to work

// Using async && await
//  - A function prefixed with async awaiting an asynchronous operation
//    should have a return type of Future<data_type>
// -  prefix the function body with "async"

Future<String> fetchOrder() =>
    Future.delayed(Duration(seconds: 2), () => "Out of oat milk!");

//Future.value and Future.error are good when writing unit tests and Future API's
// Future.value creates a future completed with the value passed
// awaits if the value passed is a Future
Future<String> fetchOrder2() => Future.value("Have a tea!");

Future<String> fetchOrder3() =>
    Future.error(throw Exception("out of green tea!"));
Future<int> main() async {
  // prefix function call with "await"
  print("Order started!");
  try {
    final order = await fetchOrder();
    final order2 = await fetchOrder3();
    print(order);
    print(order2);
  } catch (error) {
    print(error);
  } finally {
    print("Completed Order!");
  }
  return 0;
}
