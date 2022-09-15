// Futures with async && await

Future<String> fetchOrder() => Future.delayed(
    Duration(seconds: 2), () => throw Exception("Out of oat milk!"));
// Future.delayed(Duration(seconds: 2), () => 'Vanilla Oat Milk Cold Brew');

// await
//  - await keyword to wait for a Future to be complete
//  - get the result value a Future returns
//  - only allowed in functions that have a function body prefixed with async

// Asynchronous exception handling
// use try catch finally with asynchronous functions to hand exceptions

// async
//  -

// Using async && await
//  - A function prefixed with async awaiting an asynchronous operation
//    should have a return type of Future<data_type>
// -  prefix the function body with "async"
Future<int> main() async {
  // prefix function call with "await"
  print("Order started!");
  try {
    final order = await fetchOrder();
    print(order);
  } catch (error) {
    print(error);
  } finally {
    print("Completed Order!");
  }
  return 0;
}
