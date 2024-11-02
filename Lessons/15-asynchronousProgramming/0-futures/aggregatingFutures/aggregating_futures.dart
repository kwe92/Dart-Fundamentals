import 'dart:math';

Future<void> main() async {
  // start all asynchronous operations at once and return the result of the first Future to complete
  final String result = await Future.any([
    fetchFromServer1(),
    fetchFromServer2(),
    fetchFromServer3(),
  ]);

  print(result);

  // start all asynchronous operations at once and wait for the longest running Future to complete
  // then return all of their results
  final List<String> result2 = await Future.wait([
    fetchFromServer1(),
    fetchFromServer2(),
    fetchFromServer3(),
  ]);

  print(result2);
}

// Asynchronous Functions to Simulate Fetching Data From a Server

Future<String> fetchFromServer1() async {
  print('started fetching data from server 1...');

  await Future.delayed(const Duration(seconds: 2));

  return 'Some data from some web server 1.';
}

Future<String> fetchFromServer2() async {
  print('started fetching data from server 2...');

  await Future.delayed(const Duration(seconds: 3));

  final randomFailure = Random().nextBool();

  if (randomFailure) {
    throw Exception('I failed to reach the server.');
  }
  return 'Some data from some web server 2.';
}

Future<String> fetchFromServer3() async {
  print('started fetching data from server 3...');

  await Future.delayed(const Duration(seconds: 10));

  return 'I took a long time to get a response from server 3.';
}

// Aggregating Futures

//   - multiple concurrent computations can have their Future values combined
//     using operations similar to the logical connectives AND and OR

// Future.wait - Logical AND | logically equivalent to TypeScripts Promise.all()

//   - combines an iterable collection of Futures into a single Future
//     that waits for all Futures to be complete or fail

//   - returns an array of their results in the order in which the Futures were called
//     not in the order in which the Futures complete

//   - if any of the Futures fail then the entire Future.wait() fails

//   - great for executing multiple concurrent operations at once that do not depend on eachother
//     but all of them need to be completed to proceed

//     -  e.g. the start up logic of an application which may require the completion of
//        multiple ansychronous operations

// Future.any - Logical OR | logically equivalent to TypeScripts Promise.any()

//   - returns the first Future in an iterable of futures that completes

//   - e.g. you send multiple requests for a service with multiple servers and you only care
//     about the fastest one to be returned
