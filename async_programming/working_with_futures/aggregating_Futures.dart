Future<void> main() async {
  // final String result = await Future.any([
  //   fetchFromServer1(),
  //   fetchFromServer2(),
  //   fetchFromServer3(),
  // ]);

  // print(result);

  final List<String> result2 = await Future.wait([
    fetchFromServer1(),
    fetchFromServer2(),
    fetchFromServer3(),
  ]);

  print(result2);
}

Future<String> fetchFromServer1() async {
  print('started fetching data from server 1');

  await Future.delayed(const Duration(seconds: 2));

  return 'Some data from some web server.';
}

Future<String> fetchFromServer2() async {
  print('started fetching data from server 2');

  await Future.delayed(const Duration(seconds: 3));

  throw Exception('I failed to reach the server.');
}

Future<String> fetchFromServer3() async {
  print('started fetching data from server 3');

  await Future.delayed(const Duration(seconds: 10));

  return 'I am taking a long time to get server response.';
}

// Aggregating Futures

//   - multiple parallel computations can have their Future values combined
//     using operations similar to the logical connectives AND and OR

// Future.wait - Logical AND | logically equivalent to TypeScripts Promise.all()

//   - Combines an iterable collection of Futures into a single Future
//     that waits for all Futures to be complete or fail

//   - returns an array of their results

//   - if any of the Futures fail then the entire Future.wait() fails


// Future.any - Logical OR | logically equivalent to TypeScripts Promise.any()

//   - returns the first Future in an iterable of futures that completes
