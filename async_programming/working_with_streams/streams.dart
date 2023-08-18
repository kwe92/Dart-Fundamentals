// Asynchronous Stream

//  - a "Stream" is a sequence of asynchronous events
//  - a "Stream" can be conidered an asynchronous iterable

// Create and add values to a steam:

//   ~ Stream.fromiterable

//       - generate a stream from an iterable

//   ~ Stream generator(async*, yield)

//       - stream generator function
//       - a function that uses keywords async* aor yeild

//   ~ StreamControler

//       - more granular approach to how items are added to a stream

Future<num> sumStream(Stream<num> stream) async {
  num result = 0;
  await for (var ele in stream) {
    result += ele;
  }
  return result;
}

// Stream.reduce

//    - Works like the Iterable.reduce
//    - awaits every event to be available without explicitly being told by the user

Future<int> sumStream2(Stream<int> stream) => stream.reduce((previous, element) => previous + element);

// Stream Generators

//    - similar to the synta of creating functions thar return a future
//    - use "async*" prefix body rather than "async" keyword prefix for the body
//    - use "yeild" instead of "await"
//    - returns a Stream rather than a Future

Stream<int> countStream(int n) async* {
  for (var i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1));
    print("squenced stream of data: $i");
    yield i;
  }
}

// sync* generator
Iterable<num> syncGenerator(int n) sync* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

Future<int> main() async {
  // final stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  final stream2 = countStream(5);
  final sumOfStream = await sumStream2(stream2);
  print("Sum of stream sequence: $sumOfStream");
  return 0;
}

// Iterable vs Stream - Similarities

//   - Iterable and Stream type / class have many similarites
//   - they both can be iteratied over with a for loop
//   - they can be created with generator functions
//   - they share similar methods / functions to proccess and modify items

// Iterable vs Stream differences

//   - Iterables are synchronous
//   - Streams are asynchronous
