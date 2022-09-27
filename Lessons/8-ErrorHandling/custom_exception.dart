class OutOfRange implements Exception {
  OutOfRange([this.message]) : super();
  final String? message;

  @override
  String toString() {
    if (message == null) {
      return "OutOfRange";
    }
    return "OutOfRange: $message";
  }
}

int main() {
  throw OutOfRange("Error");
}
