// ---------------------------------------------------------
// 1. HELPER CLASSES
// ---------------------------------------------------------

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

abstract class Shape {
  (Point, Point) boundingBox();

  // Factory method to create a manipulator
  Manipulator createManipulator();

  bool isEmpty();
}

// ---------------------------------------------------------
// 3. THE ADAPTEE (TextView)
// ---------------------------------------------------------

class TextView {
  final double _x;
  final double _y;
  final double _width;
  final double _height;

  TextView(this._x, this._y, this._width, this._height);

  // Adaptee specific methods
  Point getOrigin() => Point(_x, _y);

  Point getExtent() => Point(_width, _height);

  bool isEmpty() => _width == 0 || _height == 0;
}

// ---------------------------------------------------------
// 4. THE ADAPTER (TextShape) - Object Adapter
// ---------------------------------------------------------

class TextShape implements Shape {
  final TextView _text;

  TextShape(this._text);

  @override
  (Point, Point) boundingBox() {
    final origin = _text.getOrigin();
    final extent = _text.getExtent();

    final bottomLeft = Point(origin.x, origin.y);
    final topRight = Point(origin.x + extent.x, origin.y + extent.y);

    print("ClassAdapter calculated bounds: $bottomLeft to $topRight");

    return (bottomLeft, topRight);
  }

  @override
  bool isEmpty() => _text.isEmpty(); // Forward the request directly to the adaptee

  @override
  Manipulator createManipulator() => TextManipulator(this);
}

// ---------------------------------------------------------
// CLIENT CODE
// ---------------------------------------------------------

void main() {
  // 1. Create the Adaptee (The incompatible class)
  final myTextView = TextView(10.0, 20.0, 100.0, 50.0);

  // 2. Create the Adapter, injecting the Adaptee
  final textShape = TextShape(myTextView);

  // 3. The Client uses the Shape interface, unaware it is using a TextView
  print("Client: Checking if shape is empty...");
  print("Is Empty? ${textShape.isEmpty()}");

  print("\nClient: Requesting BoundingBox...");

  // The adapter converts the TextView's coordinates internally
  final boundingBox = textShape.boundingBox();

  print("BoundingBox: $boundingBox");

  print("\nClient: Creating Manipulator...");
  Manipulator m = textShape.createManipulator();
  m.drag();
}
// ------------------------------------------------------------------------------------------------------------------------ //

// NOTE: The Adapter Pattern Object requires more code but works better with subclasses
//       also seems easier to test with Dependency Injection

// ------------------------------------------------------------------------------------------------------------------------ //

// ---------------------------------------------------------
// 3. THE ADAPTEE (TextView)
// ---------------------------------------------------------

// The existing toolkit class that is incompatible with Shape.
// It uses Origin/Extent logic instead of BoundingBox logic.

// ------------------------------------------------------------------------------------------------------------------------ //

// ---------------------------------------------------------
// 4. THE ADAPTER (TextShape) - Object Adapter
// ---------------------------------------------------------

// Adapts the TextView interface to the Shape interface.
// Uses Composition (holding a reference to TextView) rather than
// Multiple Inheritance

// ------------------------------------------------------------------------------------------------------------------------ //
