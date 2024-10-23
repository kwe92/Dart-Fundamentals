class OutOfRange implements Exception {
  final String? message;

  const OutOfRange([this.message]);

  @override
  String toString() => message == null ? "OutOfRange" : "OutOfRange: $message";
}

void main() => throw OutOfRange("index out of range!");


//  Implementing Custom Exceptions

//    - throwing application specific exceptions can be achieved by implementing the
//      Exception interface