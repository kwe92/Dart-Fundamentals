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

//  - Typically define as an interface (or abstract class)

abstract class Shape {
  (Point, Point) boundingBox();

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
  (Point, Point) boundingBox() {
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
  // 1. Create the Adapter directly
  // Note: We don't create a separate TextView object; the TextShape IS a TextView (by inheritance)
  final Shape shape = TextShape(10.0, 20.0, 100.0, 50.0);

  // to further clarify the aforementioned note
  final TextView textView = TextShape(10.0, 20.0, 100.0, 50.0);

  // 2. The Client treats a TextShape strictly as a Shape
  print("Client: Requesting BoundingBox...");

  final boundingBox = shape.boundingBox();

  print("BoundingBox: $boundingBox");

  print("\nClient: Checking isEmpty...");

  // This triggers the inherited method from TextView
  print("Is Empty? ${shape.isEmpty()}");

  print("\nClient: Creating Manipulator...");
  Manipulator m = shape.createManipulator();
  m.drag();
}

// ------------------------------------------------------------------------------------------------------------------------ //

//  - The key to class adapters is to use one inheritance branch (Multiple inheritance)
//    to inherit the interface (extend in our language specific case)
//    and another branch to inherit the implementation (implements in our language specific case)

// KEY DIFFERENCE FROM OBJECT ADAPTER:

//  1. We EXTEND TextView: This inherits the implementation/state directly

//  2. We IMPLEMENT Shape: This promises to satisfy the Target interface

// ------------------------------------------------------------------------------------------------------------------------ //

// Passing Initializatino Data Up
  // The constructor passes initialization data up to the parent (Adaptee)
  // removing the need to redefine variables

// ------------------------------------------------------------------------------------------------------------------------ //

// DIRECT CALLS:
// Because we extended TextView, we can call getOrigin()
// and getExtent() directly on 'this' (super). We do not need a
// delegate object like '_text.getOrigin()'

// ------------------------------------------------------------------------------------------------------------------------ //

// NOTE on isEmpty():
// We do not need to override isEmpty()
// Since we extend TextView, we automatically inherit TextView.isEmpty()
// Which satisfies the Shape.isEmpty() contract automatically
// A key benefit of Class Adapters: automatic implementation reuse

// ------------------------------------------------------------------------------------------------------------------------ //