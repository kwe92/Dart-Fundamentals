// Future
//  - a "Future" represents the results of an asynchronous operation
//  - Futures are used to wait for an asynchronous operation to complete
//    like fetching data from a database / api or reading from a file

// Future States
//  - a Future has two states:
//    - Uncomplete (waiting for an asynchronous operation to complete)
//    - Complete (asynchronous operation returns a value or throws an error)
//      both cases should be handled

// create a function that returns Future of type String
Future<String> fetchUserOrder() => Future.delayed(
    Duration(seconds: 2), () => throw Exception('Out of oat milk!'));
//Future.delayed(Duration(seconds: 2), () => 'Vanilla Oat Milk Cold Brew');

// What is Future.delayed?
//   - a factory constructor for the future class
int main() {
  print('program has started!');
  // .then()
  //  - a method that is part of the Future type
  //  - returns the result inside an asynchronous function
  fetchUserOrder()
      .then((order) => print('Order is ready: $order'))
      // catchError if one is thrown and return as print statement
      .catchError((err) => print(err))
      // .whenComplete
      //  - Calls the passed anonymous function
      //  - When the asynchronous operation is complete regardless of outcome
      .whenComplete(() => print('Completed Order!'));
  return 0;
}
