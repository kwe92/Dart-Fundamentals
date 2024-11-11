import 'dart:async';

class StreamCounter {
  static int _streamCount = 0;

  static int get streamCount => _streamCount;

  /// creates a stream that outputs integers with a delay inbetween each output
  static Stream<int> counter(int n, [int? delayInSeconds]) async* {
    _streamCount++;

    for (var i = 0; i < n; i++) {
      var result = i + 1;
      await Future.delayed(Duration(seconds: delayInSeconds ?? 1));

      // print("stream of data for stream number $_streamCount: $result\n");

      yield result;
    }
  }
}

Future<num> sumStream(Stream<num> stream) async {
  num result = 0;
  await for (var ele in stream) {
    result += ele;
  }
  return result;
}

Future<int> sumStream2(Stream<int> stream) async => await stream.reduce((previous, element) => previous + element);

Future main() async {
  final stream = await Stream.fromIterable([1, 2, 3, 4, 5]);

  final stream2 = StreamCounter.counter(5);

  final sumOfStream = await sumStream(stream);

  final sumOfStream2 = await sumStream2(stream2);

  print("Sum of stream sequence 1: $sumOfStream");

  print("Sum of stream sequence 2: $sumOfStream2");

  final stream3 = StreamCounter.counter(5);

  stream3.listen((data) {
    print('stream 3 event recieved');
  });

  final stream4 = StreamCounter.counter(6);

  // reference StreamSubscription with listen and onData parameter as it will be overridden
  final streamSubscription = stream4.listen((_) {});

  // override the StreamSubscription onData callback to puase and resume the StreamSubscription given some conditions
  streamSubscription.onData((data) {
    if (data == 3) {
      // pause Stream for two seconds and then resume the Stream
      streamSubscription.pause(
        Future.delayed(const Duration(seconds: 2)),
      );
    } else {
      print('data from streamSubscription 1: $data');
    }
  });

  final stream5 = StreamCounter.counter(8);

  final streamSubscription2 = stream5.listen((_) {});

// if you pause a stream and do not provide a resumeSignal
// you can explicitly pause and resumes
  streamSubscription2.onData((data) async {
    if (data == 3) {
      print('data from streamSubscription 2: $data');

      streamSubscription2.pause();

      print('stream paused...');

      await Future.delayed(const Duration(seconds: 2));

      streamSubscription2.resume();

      print('stream resumed...');
    } else {
      print('data from streamSubscription 2: $data');
    }
  });
}

// Asynchronous Stream

//   - a "Stream" is a sequence of asynchronous events i.e. an iterable of Futures

//   - futures are computations that may not return a result immediately
//     and notify you when that result is complete (the event is complete)

//   - streams are a sequence of asychronous events and instead of returning the value
//     once the event is complete like a Future would Streams return the asychronous event i.e. a Future

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Processing a Stream

//   - there are two ways you can extract the values from a stream:

//       - await for (Imperative Approach)

//       - listen from the Stream API (Declarative approach)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Stream Types

//   - Single Subscription:

//       - can only be listened to once as the order of data matters and receiving all of the data
//         part of the stream matters (seems similar to how TCP sockets and packets work)

//   - Broadcast:

//       - messages can be handled indivudially and do not rely on eachother (seems similar to how UDP sockets and packets work)

//       - can be listened to multiple times by multiple listeners

//       - can be unsubscribed from and resubscribed too

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Creating and adding values to a Steam:

//   ~ Stream.fromIterable

//       - generate a stream from an iterable

//   ~ Stream generator(async*, yield)

//       - stream generator function

//       - a function that uses keywords async* or yeild

//   ~ StreamControler

//       - more granular approach to how items are added to a Stream

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Stream.reduce

//    - works like the Iterable.reduce

//    - awaits every event to be available without explicitly being told by the user

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Stream Generators

//    - similar to the syntax of creating functions that return a future

//    - use "async*" prefix body rather than "async" keyword prefix for the body

//    - use "yeild*" instead of "yeild"

//    - returns a Stream rather than a Future

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// await for

//   - an asnychronous for loop to iterate over an iterable of asynchronous events (sequence of Futures)

//   - when reading streams with await for if the stream has an error it is thrown by the loop

//   - you can add a try-catch error handler around the loop to catch any errors that will be thrown
//     by the stream if there is an error

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// Errors in Streams using await-for

//   - unless explicit measures are in place a stream will exit when an error is encoutered
//     as the loop will terminate

//   - you can use the .handleError() method part of the Stream API to work around this

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// transform() function Stream API

//   - the transform function allows you to map stream output values that come in chuncks
//     unlike map which requires a value immediately

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// listen() method Stream API

//   - allows you to subscribe and listen to events on a Stream

//   - when you start listening on a Stream a StreamSubscription object is returned

//   - a StreamSubscription object represents the active stream producing events

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

// StreamSubscription

//   - a subscription to events on a Stream

//   - when using the listen method of a Stream a StreamSubscription is returned

//   - what a StreamSubscription can do:

//       - provide events to the listener

//       - hold callbacks to handle events

//       - pause Stream

//       - resume Stream

//       - cancel Stream

