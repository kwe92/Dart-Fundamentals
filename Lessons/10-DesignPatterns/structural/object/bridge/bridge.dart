import 'dart:math';
// ---------------------------------------------------------------------------
// 1. PRIMITIVES & HELPERS
// ---------------------------------------------------------------------------

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

/// Represents the content that can be drawn onto a window
abstract class View {
  void drawOn(Window window);
}

/// A concrete view
class StringView implements View {
  final String content;

  const StringView(this.content);

  @override
  void drawOn(Window window) {
    window.drawText(content, const Point(10.0, 10.0));
  }
}

// ---------------------------------------------------------------------------
// 2. IMPLEMENTOR (Bridge Interface)
// ---------------------------------------------------------------------------

/// Defines the interface for implementation classes (Platform specifics)
abstract class WindowImp {
  void impTop();
  void impBottom();
  void impSetExtent(Point p);
  void impSetOrigin(Point p);
  void deviceRect(double x, double y, double width, double height);
  void deviceText(String text, double x, double y);
  void deviceBitmap(String bitmapName, double x, double y);
}

// ---------------------------------------------------------------------------
// 3. CONCRETE IMPLEMENTORS
// ---------------------------------------------------------------------------

class XWindowImp implements WindowImp {
  const XWindowImp();

  @override
  void impTop() => print("XWindow: Bring to top");

  @override
  void impBottom() => print("XWindow: Push to bottom");

  @override
  void impSetExtent(Point p) => print("XWindow: Resize to $p");

  @override
  void impSetOrigin(Point p) => print("XWindow: Move to $p");

  @override
  void deviceRect(double x, double y, double width, double height) {
    print("XWindow: DrawRect via XDrawRectangle at ($x, $y) [$width x $height]");
  }

  @override
  void deviceText(String text, double x, double y) {
    print("XWindow: DrawText '$text' at ($x, $y)");
  }

  @override
  void deviceBitmap(String bitmapName, double x, double y) {
    print("XWindow: DrawBitmap '$bitmapName' at ($x, $y)");
  }
}

class PMWindowImp implements WindowImp {
  const PMWindowImp();

  @override
  void impTop() => print("PMWindow: Bring to top");

  @override
  void impBottom() => print("PMWindow: Push to bottom");

  @override
  void impSetExtent(Point p) => print("PMWindow: Set Extent $p");

  @override
  void impSetOrigin(Point p) => print("PMWindow: Set Origin $p");

  @override
  void deviceRect(double x, double y, double width, double height) {
    print("PMWindow: DrawRect via GpiStrokePath (Box) at ($x, $y) [$width x $height]");
  }

  @override
  void deviceText(String text, double x, double y) {
    print("PMWindow: DrawText via GpiCharString '$text' at ($x, $y)");
  }

  @override
  void deviceBitmap(String bitmapName, double x, double y) {
    print("PMWindow: DrawBitmap via GpiBitBlt '$bitmapName' at ($x, $y)");
  }
}

class MacWindowImp implements WindowImp {
  const MacWindowImp();

  @override
  void impTop() => print("MacOS: OrderFront (Cocoa API)");

  @override
  void impBottom() => print("MacOS: OrderBack (Cocoa API)");

  @override
  void impSetExtent(Point p) => print("MacOS: SetFrameSize (Cocoa API) to $p");

  @override
  void impSetOrigin(Point p) => print("MacOS: SetFrameOrigin (Cocoa API) to $p");

  @override
  void deviceRect(double x, double y, double width, double height) {
    // Simulating Quartz 2D / CoreGraphics calls
    print("MacOS: CGContextStrokeRect ($x, $y) [$width x $height]");
  }

  @override
  void deviceText(String text, double x, double y) {
    // Simulating CoreText calls
    print("MacOS: CTFrameDraw '$text' at ($x, $y)");
  }

  @override
  void deviceBitmap(String bitmapName, double x, double y) {
    // Simulating NSImage calls
    print("MacOS: NSImage drawAtPoint '$bitmapName' at ($x, $y)");
  }
}

// ---------------------------------------------------------------------------
// 4. ABSTRACTION
// ---------------------------------------------------------------------------

/// The Abstraction class.
abstract class Window {
  final WindowImp _imp;
  final View _view;

  const Window(this._view, this._imp);

  // --- High-Level Operations ---

  void drawContents();

  void open() {
    print("Window: Open");
    drawContents();
  }

  void close() => print("Window: Close");
  void iconify() => print("Window: Iconify");
  void deiconify() => print("Window: Deiconify");

  // --- Requests Forwarded to Implementation ---

  void setOrigin(Point at) => _imp.impSetOrigin(at);
  void setExtent(Point extent) => _imp.impSetExtent(extent);
  void raise() => _imp.impTop();
  void lower() => _imp.impBottom();

  void drawRect(Point p1, Point p2) {
    final x = min(p1.x, p2.x);
    final y = min(p1.y, p2.y);
    final w = (p1.x - p2.x).abs();
    final h = (p1.y - p2.y).abs();
    _imp.deviceRect(x, y, w, h);
  }

  void drawText(String text, Point at) {
    _imp.deviceText(text, at.x, at.y);
  }

  WindowImp get imp => _imp;
  View get view => _view;
}

// ---------------------------------------------------------------------------
// 5. REFINED ABSTRACTIONS
// ---------------------------------------------------------------------------

class ApplicationWindow extends Window {
  const ApplicationWindow(View view, WindowImp imp) : super(view, imp);

  @override
  void drawContents() {
    view.drawOn(this);
  }
}

class IconWindow extends Window {
  final String _bitmapName;

  const IconWindow(
    View view,
    WindowImp imp, {
    required String bitmapName,
  })  : _bitmapName = bitmapName,
        super(view, imp);

  @override
  void drawContents() {
    imp.deviceBitmap(_bitmapName, 0.0, 0.0);
  }
}

void main() {
  final myView = StringView("Hello Bridge Pattern");

  const xPlatform = XWindowImp();
  const pmPlatform = PMWindowImp();

  const macPlatform = MacWindowImp();

  print("--- Scenario 1: Application Window on X Window System ---");
  final appWindowX = ApplicationWindow(myView, xPlatform);
  appWindowX.open();
  appWindowX.drawRect(const Point(0, 0), const Point(100, 50));

  print("\n--- Scenario 2: Icon Window on Presentation Manager ---");
  final iconWindowPM = IconWindow(
    myView,
    pmPlatform,
    bitmapName: "folder_icon.bmp",
  );
  iconWindowPM.open();
  iconWindowPM.raise();

  print("\n--- Scenario 3: Application Window on MacOS ---");

  final appWindowMac = ApplicationWindow(myView, macPlatform);
  appWindowMac.open();
  appWindowMac.drawRect(const Point(5, 5), const Point(200, 100));
}


// 1. Core Identity

      // Pattern Name: Bridge
      // Category: Structural (Object)
      // Also Known As: Handle/Body
      // Intent: Decouple an abstraction from its implementation so that the two can vary
      // independently.

// 2. The Problem & Solution (Motivation)

      // Scenario: A portable Window abstraction needs to work on multiple platforms (X Window, PM)
      // and support multiple window types (IconWindow, TransientWindow).
      // Problem: Using inheritance results in a combinatorial explosion of classes
      // (e.g., XIconWindow, PMIconWindow, XTransientWindow, PMTransientWindow).
      // Inheritance binds the implementation to the abstraction permanently.
      // Solution: Split the object into two separate class hierarchies:
      // 1. Abstraction (Window interfaces)
      // 2. Implementation (Platform-specific logic)
      // The Abstraction maintains a pointer (bridge) to the Implementation.

// 3. Participants

      // Abstraction (Window):

            // - Defines the high-level interface.
            // - Maintains a reference to an object of type Implementor.

      // RefinedAbstraction (IconWindow):

           // - Extends the interface defined by Abstraction.

      // Implementor (WindowImp):

            // - Defines the interface for implementation classes (primitives).
            // - Often different from the Abstraction's interface (lower-level).

      // ConcreteImplementor (XWindowImp, PMWindowImp):

           // - Implements the Implementor interface with platform-specific code.

// 4. Consequences

      // Decoupling: The implementation can be configured or switched at run-time.
      // Extensibility: You can extend the Abstraction and Implementor hierarchies independently.
      // Adding a new platform doesn't require changing the Abstraction classes.
      // Hiding Details: Clients are shielded from implementation details (like the "Cheshire Cat"
      // or Pimpl idiom in C++).

// 5. Implementation Issues

      // Abstract Factory: Often used to create and configure the specific Bridge (deciding
      // which ConcreteImplementor to instantiate).
      // Degenerate Bridge: If there is only one implementation, the separation is still useful
      // to insulate clients from recompilation when implementation details change.
      // Sharing Implementors: Use reference counting (Handle/Body idiom) to share one
      // implementation instance among multiple objects.

// 6. Comparison with Related Patterns

      // Adapter: Applied to systems after they are designed (makes unrelated classes work together).
      // Bridge: Used up-front in a design to let abstractions and implementations vary independently.
      // Abstract Factory: Can create and configure the Bridge.

// 7. Sample Code Use Case & Analysis

      // Scenario: A Cross-Platform GUI Toolkit.
      // The application needs to render different types of Windows (Application, Icon)
      // on different Operating Systems (X11, Presentation Manager, MacOS).

      // The "Cartesian Product" Avoidance:

            // - Without Bridge: You would need classes like MacApplicationWindow, MacIconWindow,
            //   XApplicationWindow, XIconWindow, etc. (M x N classes).

            // - With Bridge: We added MacWindowImp (1 new class) and it immediately worked with
            //   both ApplicationWindow and IconWindow. (M + N classes).

      // Separation of Duties:

            // - Abstraction (Window): Handles business logic, like "drawRect" which calculates
            //   width/height from points.
            // - Implementor (WindowImp): Handles raw API calls, like "deviceRect(x,y,w,h)".
            // - The "Bridge" is the forwarding call: Window calls _imp.deviceRect(...).

      // Runtime Flexibility:

            // - The Main function demonstrates that the specific implementation (XWindowImp vs MacWindowImp)
            //   is injected into the Window constructor. This means the look-and-feel could theoretically
            //   be switched dynamically without changing the Window object structure.


// 8. Practical Context & Modern Application (From Personal Notes)

      // Why you likely haven't implemented this (Framework vs. App Dev):

            // - The Bridge pattern is typically used by Framework Developers, not Application Developers.
            // - If you use Flutter, React Native, or Java Swing, you are the CLIENT of a Bridge:

                  //   - Example: Flutter is the Bridge.
                  //   - You write Dart widgets (Abstraction).
                  //   - The Flutter Engine has implementations for iOS/Metal and Android/Vulkan (Implementation).
                  //   - You don't write the bridge; you stand on top of it.

      // When to use it (Modern Backend Scenarios):
            // 1. Database Drivers:

                  //    - Abstraction: Repository (saveUser(), getUser()).
                  //    - Implementation: Drivers (PostgresDriver, MySQLDriver, MongoDriver).
                  //    - Benefit: Switch DBs without rewriting business logic.

            // 2. Payment Gateways:

                  //    - Abstraction: PaymentProcessor (processRefund(), chargeCard()).
                  //    - Implementation: StripeAdapter, PayPalAdapter, SquareAdapter.
                  //    - Benefit: Shopping cart logic is decoupled from specific API endpoints.

            // 3. File Storage:

                  //    - Abstraction: FileService (upload(), download()).
                  //    - Implementation: AWS_S3_Imp, Azure_Blob_Imp, Local_Disk_Imp.

      // The "Class Explosion" Math (Why it matters):
      
            // Scenario: 5 Window Types (App, Icon, Dialog, etc.) x 4 Platforms (Win, Linux, Mac, Android).

      // Without Bridge (Inheritance):

            // - Formula: Types x Platforms
            // - Result: 5 x 4 = 20 distinct classes.
            // - Maintenance: Fixing a bug in "Linux" logic requires pasting the fix into 5 different files.

      // With Bridge (Composition):

            // - Formula: Types + Platforms
            // - Result: 5 + 4 = 9 distinct classes.
            // - Maintenance: Fix "Linux" logic in 1 file (LinuxWindowImp), and all 5 types inherit the fix.