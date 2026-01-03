// ignore_for_file: unused_local_variable

typedef Coord = double;

class Component {
  final Coord natural;
  final Coord stretch;
  final Coord shrink;

  Component(this.natural, this.stretch, this.shrink);
}

/// The Strategy Interface
abstract class Compositor {
  int compose(
    List<Coord> natural,
    List<Coord> stretch,
    List<Coord> shrink,
    int componentCount,
    int lineWidth,
    List<int> breaks,
  );
}

/// Concrete Strategy 1: SimpleCompositor
class SimpleCompositor implements Compositor {
  @override
  int compose(
    List<Coord> natural,
    List<Coord> stretch,
    List<Coord> shrink,
    int componentCount,
    int lineWidth,
    List<int> breaks,
  ) {
    print("SimpleCompositor: Calculating breaks (ignoring stretchability)...");

    return breaks.length;
  }
}

/// Concrete Strategy 2: TeXCompositor
class TeXCompositor implements Compositor {
  @override
  int compose(
    List<Coord> natural,
    List<Coord> stretch,
    List<Coord> shrink,
    int componentCount,
    int lineWidth,
    List<int> breaks,
  ) {
    print("TeXCompositor: Calculating breaks globally (using all metrics)...");
    return breaks.length;
  }
}

/// Concrete Strategy 3: ArrayCompositor
class ArrayCompositor implements Compositor {
  final int _interval;

  ArrayCompositor(this._interval);

  @override
  int compose(
    List<Coord> natural,
    List<Coord> stretch,
    List<Coord> shrink,
    int componentCount,
    int lineWidth,
    List<int> breaks,
  ) {
    print("ArrayCompositor: Breaking at fixed interval $_interval...");

    return breaks.length;
  }
}

/// The Context
class Composition {
  final Compositor _compositor;
  final List<Component> _components = [];
  int _lineWidth = 100;
  List<int> _lineBreaks = [];

  int get componentCount => _components.length;

  Composition(this._compositor);

  void addComponent(Component c) => _components.add(c);

  void repair() {
    List<Coord> natural = _components.map((c) => c.natural).toList();
    List<Coord> stretch = _components.map((c) => c.stretch).toList();
    List<Coord> shrink = _components.map((c) => c.shrink).toList();
    int componentCount = _components.length;

    _lineBreaks.clear();

    int breakCount = _compositor.compose(
      natural,
      stretch,
      shrink,
      componentCount,
      _lineWidth,
      _lineBreaks,
    );

    print("Layout complete. $_lineBreaks breaks generated.\n");
  }
}

void main() {
  Composition quick = Composition(SimpleCompositor());
  quick.addComponent(Component(10, 2, 1));
  quick.repair();

  Composition slick = Composition(TeXCompositor());
  slick.addComponent(Component(10, 5, 2));
  slick.repair();

  Composition iconic = Composition(ArrayCompositor(100));
  iconic.addComponent(Component(10, 0, 0));
  iconic.repair();
}

// 1. Core Identity

      // Pattern Name: Strategy
      // Category: Behavioral (Object)
      // Also Known As: Policy
      // Intent: Define a family of algorithms, encapsulate each one, and make them interchangeable.
      // Strategy lets the algorithm vary independently from clients that use it.

// 2. The Problem & Solution (Motivation)

      // Scenario: A text editor needs to break a stream of text into lines. Different situations
      // require different algorithms (Simple line-by-line, TeX global optimization, Fixed Arrays).
      // Problem: Hard-wiring these algorithms into the Client (Composition) makes the class
      // complex and hard to maintain. It also requires massive conditional logic (switch/case)
      // to select the right one.
      // Solution: Encapsulate each algorithm in a separate Strategy class (Compositor).
      // The Client holds a reference to a Strategy object and forwards the work to it.

// 3. Participants

      // Strategy (Compositor):
      
            // - Declares an interface common to all supported algorithms.
            // ConcreteStrategy (SimpleCompositor, TeXCompositor):
            // - Implements the algorithm using the Strategy interface.
      
      // Context (Composition):
            
            // - Is configured with a ConcreteStrategy object.
            // - Maintains a reference to a Strategy object.
            // - Forwards requests to the Strategy.
            // - Note: "Context" refers to the wrapper class triggering the logic, not the data passed in.

// 4. Consequences

      // Elimination of Conditionals: Replaces massive switch/case statements with polymorphism.
      // Families of Algorithms: Defines a hierarchy of interchangeable behaviors.
      // Alternative to Subclassing: Instead of subclassing the Context to change behavior
      // (e.g., SimpleComposition, TeXComposition), you delegate to a separate object.
      // Communication Overhead: The Strategy interface must be generic enough for all algorithms.
      // Simple strategies might not use all the parameters passed to them.
      // Increased Object Count: Introduces more classes and objects into the system.

// 5. Implementation Issues

      // Data Access (Push vs. Pull):

            // - Push: Context passes data as parameters (Decoupled, but might pass too much).
            // - Pull: Context passes ITSELF to the Strategy (Coupled, but Strategy takes exactly what it needs).
      
      // Stateless Strategies: If strategies have no internal state, they can be shared (Flyweight).
      
      // Optional Strategy: Context can check if the Strategy is null; if so, execute default behavior.

// 6. Sample Code Use Case & Analysis

      // Scenario: Text Layout Engine (Line Breaking).

      // Encapsulation of Logic:

            // - `SimpleCompositor` ignores stretchability and just breaks lines.
            // - `TeXCompositor` performs complex calculations using all metrics.
            // - The `Composition` class (Context) doesn't know *how* the breaks are calculated.

      // Runtime Configuration:

            // - The Main function creates three identical `Composition` objects but injects different
            // `Compositor` strategies. This demonstrates swapping behavior without changing code.

// 7. Functional Programming Perspective (Modern Approach)

      // In languages where functions are "First Class Citizens" (like Dart):

            // - You can use function typedefs instead of interfaces.
            // - You can pass functions/lambdas instead of concrete classes.
            // - Instead of conforming to a class type, you conform to a function signature.
            // - State can be captured using closures rather than instance variables.

// 8. Key Architectural Insights (The "Why")

// Composition over Inheritance:

      // - Strategy is a specific decision to prefer Composition (has-a) over Inheritance (is-a).
      // - Unlike subclassing, which hard-wires behavior, Strategy allows behavior to change
      // dynamically without destroying the Context object.

// "Logic as Data":

      // - The Strategy Pattern is simply the OOP way of treating algorithms as first-class citizens
      // (passing logic around as if it were data).
