class InitialzationError extends Error {
  final String message;

  InitialzationError([this.message = "Error: Initial count has already been set."]);

  @override
  String toString() {
    return message;
  }
}

/// Represents a mutable counter that can be incremented and decremented
class Counter {
  // mutable rep
  int _count;

  // observer operation
  int get count => _count;

  static Counter? _singleton;

  // creator operation
  factory Counter([int? initialCount]) {
    if (initialCount != null && _singleton != null) {
      throw InitialzationError();
    }
    _singleton ??= Counter._internal(initialCount);

    return _singleton!;
  }

  // creator operation
  Counter._internal(int? initialCount) : _count = initialCount ?? 0;

  // mutator operation
  void increment() => _count++;

  // mutator operation
  void decrement() => _count > 0 ? _count-- : null;
}

// Singleton

//   - a creational design pattern ensuring that there is only one instance of a class with global access

// How Singletons Are Implemented

//   - the default constructor will be hidden from user

//   - a private named constructor will be implemented

//   - the class instance will be stored in a static variable

//   - a static creation method / factory method will be implemented that returns the instance (cahced object in the static field)