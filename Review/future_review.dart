// Future
//  - a "Future" represents the results of an asynchronous operation
//  - Futures are used to wait for an asynchronous operation to complete
//    like fetching data from a database / api or reading from a file

// Future States
//  - a Future has two states:
//    - Uncomplete (waiting for an asynchronous operation to complete)
//    - Complete (asynchronous operation returns a value or throws an error)
//      both cases should be handled

Future<String> fetchOrder() =>
    Future.delayed(Duration(seconds: 2), () => "Es Yen - Oat Milk");

Future<void> main() async {
  print("Awaiting order...");
  try {
    final order = await fetchOrder();
    print("Order: $order is ready!");
  } catch (error) {
    print(error);
  } finally {
    print("Order complete, thank you for being a customer!");
  }
}
