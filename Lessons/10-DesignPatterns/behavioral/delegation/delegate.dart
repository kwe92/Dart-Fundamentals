// THE INTERFACE (Contract)
// Technically a Base Class here
abstract class DimensionProvider {
  final double width;
  final double height;
  final _delegate = RectangleDelegate();
  DimensionProvider(this.width, this.height);
}

// DELEGATOR 1: Window
class Window extends DimensionProvider {
  Window(double width, double height) : super(width, height);

  double getArea() => _delegate.calculateArea(this);
}

// DELEGATOR 2: Image
class Image extends DimensionProvider {
  Image(double width, double height) : super(width, height);

  double getPixelCount() => _delegate.calculateArea(this);
}

// THE DELEGATE
class RectangleDelegate {
  double calculateArea(DimensionProvider source) => source.width * source.height;
}

void main() {
  final window = Window(12, 36);
  final image = Image(12, 24);

  print('window area: ${window.getArea()}');
  print('pixels in image: ${image.getPixelCount()}');
}


// 1. Core Identity

      // Concept Name: Delegation
      // Category: Fundamental OO Principle / Idiom (Behavioral mechanics)
      // Also Known As: "Composition over Inheritance", Helper Pattern, Surrogate.
      // Intent: To reuse behavior by forwarding a responsibility to another object
      // (the Delegate) instead of inheriting it from a superclass.

// 2. The Problem & Solution (Motivation)

      // Scenario: Multiple unrelated classes (Window, Image) need to share specific
      // logic (e.g., Area calculation), but they already inherit from different parents,
      // or the logic might need to change at runtime.
      // Problem: Inheritance is static (compile-time) and rigid. "White-box" reuse
      // (subclassing) exposes parent internals and leads to class explosions or the
      // "Diamond Problem" in languages without multiple inheritance.
      // Solution: "Black-box" reuse. The Window class does not inherit the logic;
      // it contains a "Delegate" object. When Window is asked to calculate area,
      // it forwards the call to the Delegate, often passing 'this' so the Delegate
      // can access the Window's state.

// 3. Participants

      // Delegator (Receiver/Window):

            // - Receives the request from the client.
            // - Maintains a reference to the Delegate instance.
            // - Forwards the request to the Delegate (optionally passing 'this').

      // Delegate (Helper/RectangleDelegate):

            // - The object to which the work is assigned.
            // - Implements the actual behavior/algorithm.
            // - Operates on the Delegator's data (via arguments).

      // Interface (Optional/DimensionProvider):

            // - Defines the contract that the Delegator fulfills and the Delegate expects.

// 4. Types & Implementation Styles

      // A. Strict Delegation: The Delegator passes this to the Delegate.
      // The Delegate performs operations on the Delegator instance specifically.
      // (Effective simulation of method overriding).
      // B. Simple Forwarding: The Delegator calls a method on the helper without
      // passing this. The helper acts independently of the caller's context.
      // C. Dynamic Delegation: The delegate object is injected or swapped at runtime
      // (Foundation of the Strategy and State patterns).

// 5. Consequences & Trade-offs

      // Flexibility: Behavior can be composed at runtime (Dynamic) rather than
      // fixed at compile-time (Static Inheritance).
      // Encapsulation: The Delegator can hide the Delegate, exposing only specific methods.
      // Boilerplate: Requires writing forwarding methods (wrapper code) for every
      // function you want to expose, whereas inheritance exposes them automatically.
      // Performance: Introduces a slight runtime overhead (one extra method call)
      // compared to direct inheritance.

// 6. Comparison with Related Patterns

      // Inheritance: "Is-a" relationship. Static. The subclass is the parent.
      // Delegation: "Has-a" relationship. Dynamic. The object uses a helper.
      // Strategy Pattern: A Behavioral pattern that uses Delegation to switch
      // algorithms (strategies) at runtime.
      // Adapter: Uses Delegation to translate one interface into another.
      // Decorator: Uses Delegation to add behavior to an object transparently.

// 7. Sample Code Use Case & Analysis

      // Scenario: Sharing geometry logic between a Window and an Image.

      // The Delegation Mechanic (The "Magic"):

            // - Window inherits from DimensionProvider (defines width/height).
            // - Window holds _delegate = RectangleDelegate().
            // - When window.getArea() is called, it executes _delegate.calculateArea(this).
            // - Crucial: The this keyword passes the Window instance to the delegate, allowing
            //   the delegate to read window.width and window.height.

      // Dependency Analysis:

            // - In this specific example, the delegate is hardcoded (= RectangleDelegate()),
            // creating a tight coupling suitable for static helper logic.
            // - If the delegate were passed via constructor, it would become the Strategy Pattern.