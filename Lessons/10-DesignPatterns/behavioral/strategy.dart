// ignore_for_file: unused_local_variable

typedef Coord = double;

/// Like a Widget
class Component {
  final Coord natural;
  final Coord stretch;
  final Coord shrink;

  Component(this.natural, this.stretch, this.shrink);
}

/// The Strategy Interface
/// Encapsulates a linebreaking strategy
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
  final List<Component> _components = []; // The list of components
  int _lineWidth = 100; // Example width
  List<int> _lineBreaks = [];

  int get componentCount => _components.length;

  Composition(this._compositor);

  void addComponent(Component c) => _components.add(c);

  /// Prepares data and calls the strategy.
  void repair() {
    // Prepare independent arrays to "take the data to the strategy"
    List<Coord> natural = _components.map((c) => c.natural).toList();
    List<Coord> stretch = _components.map((c) => c.stretch).toList();
    List<Coord> shrink = _components.map((c) => c.shrink).toList();
    int componentCount = _components.length;

    // Prepare the buffer for the strategy to fill
    _lineBreaks.clear();

    // Delegate to the Strategy
    int breakCount = _compositor.compose(
      natural,
      stretch,
      shrink,
      componentCount,
      _lineWidth,
      _lineBreaks,
    );

    // Lay out components according to breaks (omitted)
    print("Layout complete. $_lineBreaks breaks generated.\n");
  }
}

void main() {
  // 1. Composition with SimpleCompositor
  Composition quick = Composition(SimpleCompositor());
  quick.addComponent(Component(10, 2, 1));
  quick.repair();

  // 2. Composition with TeXCompositor
  Composition slick = Composition(TeXCompositor());
  slick.addComponent(Component(10, 5, 2));
  slick.repair();

  // 3. Composition with ArrayCompositor (passing specific state)
  Composition iconic = Composition(ArrayCompositor(100));
  iconic.addComponent(Component(10, 0, 0));
  iconic.repair();
}

// 1. Strategy Pattern Summary:

//  - Define a family of algorithms (Compositor interface and its implementations)

//  - Encapsulate each algorithm in its own class (SimpleCompositor, TeXCompositor, ArrayCompositor)

//  - Make them interchangeable within the Context (Composition class / Client code)

//  - In a functional approach in a language where functions are treated as first class objects
//    we can use function typedefs and pass functions instead of classes

//  - instead of conforming to the class type we conform to the function signature

//  - the functions should be stateless or we can use closures to capture state

// 2. When to Use The Strategy Pattern

//     - Refactoring Conditionals: Use it to replace massive switch or if/else statements inside a class

//     - Behavioral Variations: Use it when many related classes differ only in their behavior (operation implementation)

//     - Hidden Complexity: Use it when an algorithm uses data structures that the client shouldn't know about

//     - Algorithm Variants: Use it to provide different space/time trade-offs (e.g., fast/inaccurate vs. slow/precise)

// 3. Structure & Participants

//    - Strategy (Interface (OOP)/Function Signature (Functional)): Declares the common interface for all supported algorithms

//    - ConcreteStrategy: Implements the actual algorithms using the Strategy interface

//    - Context: Maintains a reference to a Strategy object and is configured
//               by the client with a specific ConcreteStrategy
//               it then orwards requests to the Strategy

// 4. Benefits (Pros)

//    - Alternatives to Subclassing: Unlike subclassing the Context directly (which hard-wires behavior and makes the class hard to understand)
//                                   Strategy lets you vary the algorithm dynamically (run-time) and independently

//    - Eliminates Conditionals: It removes the need for "hard-coded" decision logic (case statements) in the Context

//    - Reuse: Hierarchies of Strategy classes allow algorithms to share common code via inheritance (in OOP varients)

// 5. Drawbacks (Cons)

//    - Client Burden: The client must understand how the strategies differ to select the right one

//    - Communication Overhead: The Strategy interface is generic; sometimes the Context passes parameters that a specific ConcreteStrategy doesn't use

//    - Object Explosion: It increases the total number of objects in the application (though stateless strategies can be shared as Flyweights)

// 6. Implementation Nuances

//    - Data Passing (Push vs. Pull):

//       - Push: Context passes data as parameters (keeps them decoupled, but might pass too much data)

//       - Pull: Context passes itself as an argument, and Strategy requests what it needs (more efficient, but tightly couples Strategy to Context)

//    - Optional Strategies: The Context can be designed to check if a Strategy exists; if not, it executes a default behavior

// The Context

//  - Context refers to the class that triggers the strategy (the "Client" wrapper)
//    not the data being passed into it

//  -  In OOP varients the Context maintains a collection of Components and delegates layout to a Compositor
