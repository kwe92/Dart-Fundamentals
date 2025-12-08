abstract class VisualComponent {
  void draw();
  void resize();
}

class TextView implements VisualComponent {
  @override
  void draw() => print("Drawing TextView");

  @override
  void resize() => print("Resizing TextView");
}

abstract class ComponentDecorator implements VisualComponent {
  final VisualComponent _component;

  ComponentDecorator(this._component);

  @override
  void draw() => _component.draw();

  @override
  void resize() => _component.resize();
}

class BorderDecorator extends ComponentDecorator {
  final int _width; // added primitive state

  BorderDecorator(VisualComponent component, this._width) : super(component);

  @override
  void draw() {
    super.draw(); // Forward request to component
    _drawBorder(_width); // Added behavior (After)
  }

  void _drawBorder(int width) => print("Drawing Border of width $width");
}

class ScrollDecorator extends ComponentDecorator {
  ScrollDecorator(VisualComponent component) : super(component);

  @override
  void draw() {
    super.draw();
    _drawScrollBars(); // Added behavior (After)
  }

  void _drawScrollBars() => print("Drawing ScrollBars");
}

class Window {
  VisualComponent? _contents;

  void setContents(VisualComponent contents) => _contents = contents;

  void paint() => _contents?.draw();
}

void main() {
  Window window = Window();
  TextView textView = TextView();

  window.setContents(
    BorderDecorator(
      ScrollDecorator(textView),
      1,
    ),
  );

  window.paint();

  // Within window.setContents the TextView is decorated with a ScrollDecorator
  // then wraped in a BorderDecorator creating a bordered, scrollable TextView dynamically
}

// DECORATOR PATTERN:

// Intent

//  - attach additional functionality to individual objects
//    dynamically (@ run-time) without the need to subclass using a class wrapper

//  - Decorators should be transparent (should not be depended on) and not affect other objects

// Motivation

//  - Add functionality to individual objects instead of
//    the entire class

// About

//  - Encloses an object and conforms to the enclosed objects interface

//  - inheritance requires creating a new class for each additional
//     responsibility (e.g., BorderedScrollableTextView, BorderedTextView)

//  - Forwards requests to the enclosing component and may add additional functionality
//    BEFORE and AFTER forwarding

//  - decorators can be nested together recursively in theory allowing additional functionality
//    to be added unlimitedly or mixed and matched

//  - the Client should not depend on the Decoration as a concrete object

// Participants

//  • Component (VisualComponent)

//      - defines the interface for objects that can have responsibilities added to
//        them dynamically

//  • ConcreteComponent (TextView)

//     - defines an object to which additional responsibilities can be attached

//  • Decorator

//     - maintains a reference to a Component object and implements an interface that
//       conforms to the Component's interface

//  • ConcreteDecorator (BorderDecorator, ScrollDecorator)

//     - adds responsibilities to the component

// Clsses in example

//  - VisualComponent

//      - Defines the interface for objects/Components that can have responsibilities
//        (additional state/instance variables or operations) added dynamically

//  - TextView

//     - Concrete Component to which additional responsibilities can be attached

//  - ComponentDecorator

//     - Base Decorator that maintains a reference to a Component and forwards requests to it

//  - BorderDecorator

//     - Adds a border to the enclosing component

//  - ScrollDecorator

//     - Adds scrolling capabilities to the enclosing component

//  - Window

//     - Represents a Window that holds a generic VisualComponent
