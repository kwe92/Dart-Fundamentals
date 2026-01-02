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
}
// 1. Core Identity

      // Pattern Name: Decorator
      // Category: Structural (Object)
      // Also Known As: Wrapper
      // Intent: Attach additional responsibilities to an object dynamically. Decorators provide
      // a flexible alternative to subclassing for extending functionality.

// 2. The Problem & Solution (Motivation)

      // Core Principle: Add functionality to individual objects instead of the entire class.

      // Scenario: A GUI toolkit (e.g., TextView) needs features like borders or scrolling.
      // Problem: Using inheritance is inflexible. A "BorderedTextView" class hardcodes the border
      // for every instance. If you want a "BorderedScrollableTextView", you need another
      // subclass. The number of subclasses explodes (combinatorial explosion) for every
      // feature combination.
      // Solution: Enclose the component in another object (the Decorator) that adds the feature.
      // Since the Decorator conforms to the same interface as the Component, it is transparent
      // to the client. You can nest them recursively (e.g., Border(Scroll(Text))).

// 3. Participants

      // Component (VisualComponent):

          // - Defines the interface for objects that can have responsibilities added dynamically.

      // ConcreteComponent (TextView):

            // - Defines the base object to which responsibilities are attached.

      // Decorator:

            // - Maintains a reference to a Component object.
            // - Conforms to the Component's interface.

      // ConcreteDecorator (BorderDecorator, ScrollDecorator):

            // - Adds responsibilities to the component.
            // - Forwards requests to the component, adding behavior before or after.

// 4. Consequences

      // Flexibility: More flexible than static inheritance. You can add/remove features at
      // run-time (e.g., enable scrollbars only when text overflows).
      // Pay-as-you-go: Avoids "feature-laden" classes high up in the hierarchy. You define
      // simple classes and add complex features only when needed.
      // Transparency: Clients usually cannot tell the difference between a decorated and an
      // undecorated component (assuming they rely on the interface, not object identity).
      // Small Objects: Results in systems composed of many little objects that look alike,
      // which can be hard to learn and debug.
      // Identity: A decorated component is NOT identical to the component itself (object
      // identity comparisons will fail).

// 5. Comparison: Decorator vs. Strategy

      // Analogy:

            // - Decorator changes the "skin" of an object (adds outside behavior).
            // - Strategy changes the "guts" of an object (replaces inside logic).
            
      // Applicability:

            // - Use Decorator when the Component is lightweight and you want to wrap it.
            // - Use Strategy when the Component is heavyweight. Instead of wrapping the whole thing,
            // the Component delegates specific tasks (like drawing a border) to a Strategy object.

      // Transparency:

            // - Decorator is transparent (Component doesn't know it's being decorated).
            // - Strategy is not transparent (Component must reference and maintain the Strategy).

// 6. Sample Code Use Case & Analysis

      // Scenario: A Window displaying a TextView that needs both a Border and ScrollBars.

      // Recursive Composition (The "Onion" Layering):

            // - Core: `TextView` (Knows how to draw text).
            // - Layer 1: `ScrollDecorator` (Wraps TextView). Calls `super.draw()` then draws scrollbars.
            // - Layer 2: `BorderDecorator` (Wraps ScrollDecorator). Calls `super.draw()` (which triggers scrollbars+text)
            //   then draws the border.

      // Dynamic Assembly:

            // - The `Window` class only sees a `VisualComponent`.
            // - It does not know it is holding a `BorderDecorator` which holds a `ScrollDecorator`.
            // - This allows the "main" function to construct any combination (Just Border, Just Scroll,
            //   Both, or None) without changing the Window or TextView classes.
