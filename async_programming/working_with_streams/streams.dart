/// creates a stream that outputs integers with a delay inbetween each output
Stream<int> countStream(int n, [int? delayInSeconds]) async* {
  for (var i = 0; i < n; i++) {
    await Future.delayed(Duration(seconds: delayInSeconds ?? 1));
    print("stream of data: $i");
    yield i;
  }
}

Future<num> sumStream(Stream<num> stream) async {
  num result = 0;
  await for (var ele in stream) {
    result += ele;
  }
  return result;
}

Future<int> sumStream2(Stream<int> stream) => stream.reduce((previous, element) => previous + element);

Future<int> main() async {
  // final stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  final stream2 = countStream(5);

  final sumOfStream = await sumStream2(stream2);
  print("Sum of stream sequence: $sumOfStream");

  return 0;
}

// Asynchronous Stream

//  - a "Stream" is a sequence of asynchronous events i.e. list of Futures

//  - a "Stream" can be considered an asynchronous iterable i.e. list of Futures

// Create and add values to a steam:

//   ~ Stream.fromiterable

//       - generate a stream from an iterable

//   ~ Stream generator(async*, yield)

//       - stream generator function

//       - a function that uses keywords async* or yeild

//   ~ StreamControler

//       - more granular approach to how items are added to a stream

// Stream.reduce

//    - Works like the Iterable.reduce
//    - awaits every event to be available without explicitly being told by the user

// Stream Generators

//    - similar to the synta of creating functions thar return a future

//    - use "async*" prefix body rather than "async" keyword prefix for the body

//    - use "yeild*" instead of "yeild"

//    - returns a Stream rather than a Future
