class InitialzationError extends Error {
  final String message;

  InitialzationError([this.message = "Error: Initial count has already been set."]);

  @override
  String toString() {
    return message;
  }
}

class Counter {
  int _count;

  int get count => _count;

  static Counter? _singleton;

  factory Counter([int? initialCount]) {
    if (initialCount != null && _singleton != null) {
      throw InitialzationError();
    }
    _singleton ??= Counter._internal(initialCount);

    return _singleton!;
  }

  Counter._internal(int? initialCount) : _count = initialCount ?? 0;

  void increment() => _count++;

  void decrement() => _count > 0 ? _count-- : null;
}

void main() {
  try {
    final instance00 = Counter(4);

    final instance01 = Counter();

    print('instance00 hashCode: ${instance00.hashCode}');

    print('instance01 hashCode: ${instance01.hashCode}');

    for (var i = 0; i < 5; i++) {
      instance00.increment();
      print("increment the count of instance00");
    }

    print("instance00 total count: ${instance00.count}");

    print("instance01 total count: ${instance01.count}");

    print(instance00.count == instance01.count);

    print(instance00.hashCode == instance01.hashCode);
  } catch (e, st) {
    print(e.toString());

    print(st.toString());
  }
}

// 1. Core Identity

      // Pattern Name: Singleton
      // Category: Creational (Object)
      // Intent: Ensure a class only has one instance, and provide a global point of access to it.

// 2. The Problem & Solution (Motivation)

      // Scenario: A system needs exactly one instance of a certain class (e.g., a Printer Spooler,
      // File System, or Window Manager).
      // Problem: A global variable makes an object accessible but doesn't prevent you from
      // instantiating multiple objects.
      // Solution: Make the class itself responsible for keeping track of its sole instance.
      // The class intercepts requests to create new objects and returns the existing one.

// 3. Participants

      // Singleton (Counter):

      // - Defines a static Instance operation (or Factory constructor) that lets clients access
      //   its unique instance.
      // - Is responsible for creating its own unique instance.
      // - Often keeps the constructor private/protected (`Counter._internal`) to prevent direct
      //   instantiation.

// 4. Consequences

      // Controlled Access: Encapsulates the sole instance, giving strict control over how/when
      // clients access it.
      // Reduced Name Space: Avoids polluting the global namespace with global variables.
      // Variable Number of Instances: The pattern makes it easy to change your mind later and
      // allow N instances (e.g., a pool of connections).
      // Lazy Initialization: The instance is not created until it is first requested.

// 5. Implementation Issues & Recipe

      // The Standard Implementation Recipe (From Notes):
      // 1. Hide the default constructor (make it private).
      // 2. Implement a private named constructor (e.g., `Counter._internal`).
      // 3. Store the instance in a static variable (e.g., `static Counter? _singleton`).
      // 4. Implement a static method, factory method, or getter that returns the cached instance.

      // Singleton Registry:

            // - To allow subclassing (e.g., `BombedMazeFactory` vs `MazeFactory`), you can use a
            //   Registry (Map<String, Singleton>).

            // - Clients ask for a singleton by name, and the registry looks it up. This decouples
            //   the client from the specific subclass.

      // Thread Safety:

            // - Critical in multi-threaded apps. You must ensure two threads don't run `new Singleton()`
            // at the exact same moment (Double-Checked Locking pattern).

// 6. Comparison with Related Patterns

      // Abstract Factory, Builder, and Prototype: Often implemented as Singletons because
      // usually only one factory/builder object is needed per application.

// 7. Sample Code Use Case & Analysis

// Scenario: A shared Counter.

      // The Factory Constructor (The "Magic"):

            // - Dart allows `factory` constructors which can return existing instances.
            // - `factory Counter([int? initialCount])` checks `_singleton`.
            // - If it is null (`??=`), it calls the private constructor `Counter._internal`.
            // - If it is not null, it returns the existing `_singleton`.

      // State Consistency:

            // - `instance00` increments the count 5 times.
            // - `instance01` prints the same count.
            // - `instance00 == instance01` returns true.
            // - This proves they are pointing to the exact same memory address (Same HashCode).

      // Safety Check:

            // - The code throws an `InitialzationError` if you try to re-initialize the counter
            // with a new start value after it has already been created.
