// ignore_for_file: unused_local_variable

// ---------------------------------------------------------
// 1. HELPER CLASSES
// ---------------------------------------------------------
typedef BoundingBox = (Point, Point);

class Point {
  final double x;
  final double y;
  Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

abstract class Manipulator {
  void drag();
}

class TextManipulator extends Manipulator {
  final Shape _shape;
  TextManipulator(this._shape);

  @override
  void drag() => print("Manipulator: Dragging $_shape logic...");
}

// ---------------------------------------------------------
// 2. THE TARGET (Shape)
// ---------------------------------------------------------

//  - Typically defined as an interface (or abstract class)

abstract class Shape {
  BoundingBox boundingBox();

  Manipulator createManipulator();

  bool isEmpty();
}

//  - Shape is a Pure Interface (No state or Implementations)

// ---------------------------------------------------------
// 3. THE ADAPTEE (TextView)
// ---------------------------------------------------------

class TextView {
  final double _x;
  final double _y;
  final double _width;
  final double _height;

  TextView(this._x, this._y, this._width, this._height);

  Point getOrigin() => Point(_x, _y);

  Point getExtent() => Point(_width, _height);

  bool isEmpty() {
    print("  -> (Called TextView original isEmpty)");
    return _width == 0 || _height == 0;
  }
}

// ---------------------------------------------------------
// 4. THE CLASS ADAPTER (TextShape)
// ---------------------------------------------------------
class TextShape extends TextView implements Shape {
  TextShape(double x, double y, double w, double h) : super(x, y, w, h);

  @override
  BoundingBox boundingBox() {
    final origin = super.getOrigin();
    final extent = super.getExtent();

    final bottomLeft = Point(origin.x, origin.y);
    final topRight = Point(origin.x + extent.x, origin.y + extent.y);

    print("ClassAdapter calculated bounds: $bottomLeft to $topRight");

    return (bottomLeft, topRight);
  }

  @override
  Manipulator createManipulator() => TextManipulator(this);
}

// ---------------------------------------------------------
// CLIENT CODE
// ---------------------------------------------------------

void main() {
  final Shape shape = TextShape(10.0, 20.0, 100.0, 50.0);

  print("Client: Requesting BoundingBox...");

  final boundingBox = shape.boundingBox();

  print("BoundingBox: $boundingBox");

  print("\nClient: Checking isEmpty...");

  print("Is Empty? ${shape.isEmpty()}");

  print("\nClient: Creating Manipulator...");

  Manipulator m = shape.createManipulator();

  m.drag();
}
//  1. Core Identity

      // Pattern Name: Adapter
      // Category: Structural (Both Class and Object)
      // Also Known As: Wrapper
      // Intent: Converts the interface of a class into another interface the client expects.
      // It allows classes with incompatible interfaces to work together.

// 2. The Problem & Solution (Motivation)

      // Scenario: You have a reusable toolkit class (e.g., TextView) but need it to fit a
      // specific domain interface (e.g., Shape).
      // Constraint: You cannot modify the toolkit class (no source code or shouldn't change
      // reusable code).
      // Solution: Create an Adapter class (TextShape) that maps requests from the
      // Target interface (Shape) to the Adaptee interface (TextView).

// 3. Participants

      // Target (Shape): Defines the domain-specific interface used by the Client.
      // Client (DrawingEditor): Collaborates with objects conforming to the Target interface.
      // Adaptee (TextView): The existing interface that needs adapting.
      // Adapter (TextShape): Adapts the Adaptee interface to the Target interface.

// 4. Class Adapter (Inheritance)

      // Structure: Uses multiple inheritance. Inherits publicly from Target and privately
      // from Adaptee.
      // Pros:
      // - No pointer indirection: Slightly faster; implies one object in memory.
      // - Overriding: The Adapter can easily override behavior of the Adaptee because it is a subclass.
      // Cons:
      // - Rigid: Commits to a specific concrete Adaptee class. It cannot adapt a class and
      // all its subclasses simultaneously.

// Sample Code Use Case & Analysis

      // Scenario: A Drawing Editor (Client) requires all elements to be treated as a "Shape".
      // The application wants to reuse a "TextView" class from an external toolkit, but
      // "TextView" does not implement the "Shape" interface.

  // Semantic Compatibility (Crucial Requirement):
  
        // For adaptation to work, the Target and Adaptee must share "semantic similarity."
        // They represent the same fundamental concept (a visual object occupying space)
        // but speak different languages:
        //
        // 1. Calculated Mapping (Different Signatures, Same Intent):
        //    - Target (Shape): Expects a "BoundingBox" (Bottom-Left and Top-Right points).
        //    - Adaptee (TextView): Provides "Origin" (x,y) and "Extent" (width, height).
        //    - The Adapter allows the Adaptee to conform to the Target interface by
        //      mathematically converting the Adaptee's data into the format the Target requires.
        //
        // 2. Direct Mapping (Identical Signatures):
        //    - Both classes happen to have an "isEmpty()" method.
        //    - The Adapter simply forwards this call, proving that parts of the interfaces
        //      may already align naturally.
        //
        // 3. Augmented Functionality:
        //    - The Adaptee (TextView) lacks dragging logic.
        //    - The Adapter fills this gap by implementing "createManipulator" to satisfy
        //      the Shape interface, extending the Adaptee's capabilities without modifying it.