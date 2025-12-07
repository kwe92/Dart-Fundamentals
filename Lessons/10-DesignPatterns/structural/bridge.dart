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

/// Concrete implementation for the X Window System
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

/// Concrete implementation for the Presentation Manager (PM)
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

// ---------------------------------------------------------------------------
// NEW: Concrete implementation for MacOS
// ---------------------------------------------------------------------------
// Notice: We do NOT need to create a "MacApplicationWindow" or "MacIconWindow".
// We just create this one implementation class, and the existing abstractions reuse it.
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

// ---------------------------------------------------------------------------
// 6. CLIENT CODE
// ---------------------------------------------------------------------------

void main() {
  // 1. Setup Content
  final myView = StringView("Hello Bridge Pattern");

  // 2. Select Platforms
  const WindowImp xPlatform = XWindowImp();
  const WindowImp pmPlatform = PMWindowImp();

  // NEW: We instantiate the new MacOS implementation
  const WindowImp macPlatform = MacWindowImp();

  print("--- Scenario 1: Application Window on X Window System ---");
  final Window appWindowX = ApplicationWindow(myView, xPlatform);
  appWindowX.open();
  appWindowX.drawRect(const Point(0, 0), const Point(100, 50));

  print("\n--- Scenario 2: Icon Window on Presentation Manager ---");
  final Window iconWindowPM = IconWindow(
    myView,
    pmPlatform,
    bitmapName: "folder_icon.bmp",
  );
  iconWindowPM.open();
  iconWindowPM.raise();

  // -----------------------------------------------------------------
  // NEW SCENARIO: Using the Existing "ApplicationWindow" logic
  // with the NEW "MacWindowImp" platform.
  // -----------------------------------------------------------------
  print("\n--- Scenario 3: Application Window on MacOS ---");
  // We reused the 'ApplicationWindow' class entirely!
  // We didn't need to write 'MacApplicationWindow'.
  final Window appWindowMac = ApplicationWindow(myView, macPlatform);
  appWindowMac.open();
  appWindowMac.drawRect(const Point(5, 5), const Point(200, 100));
}

// TODO: Review Comments

// 4. Why you likely haven't used it (and when you should)
// You mentioned you haven't seen this in your career. That is normal. The Bridge pattern is typically used by Framework Developers, not Application Developers.
// Why you haven't seen it:
// If you use Flutter, React Native, Java Swing, or .NET MAUI, you are the client of a Bridge Pattern.
// Flutter is the Bridge.
// You write Dart widgets (The Abstraction).
// The Flutter Engine has implementations for iOS (Metal/OpenGL) and Android (Vulkan/OpenGL) (The Implementation).
// You don't write the bridge; you stand on top of it.
// When you SHOULD use it:
// You should use the Bridge pattern if you are building a system that needs to run on multiple external "engines" that might change, and you want your business logic to stay clean.
// Real-world examples (besides UI):
// Database Drivers:
// Abstraction: Your Repository/Service class (saveUser(), getUser()).
// Implementation: The Database Driver (PostgresDriver, MySQLDriver, MongoDriver).
// Benefit: You can switch from MySQL to Postgres without rewriting your business logic saveUser() method.
// Payment Gateways:
// Abstraction: PaymentProcessor (processRefund(), chargeCard()).
// Implementation: StripeAdapter, PayPalAdapter, SquareAdapter.
// Benefit: Your shopping cart logic doesn't need to know the specific API endpoints of Stripe.
// File Storage:
// Abstraction: FileService (upload(), download()).
// Implementation: AWS_S3_Imp, Azure_Blob_Imp, Local_Disk_Imp.
// Summary
// The Problem: You have two changing dimensions (e.g., Logical Features vs. Operating Systems) causing code duplication and too many subclasses.
// The Fix: Separate them into two class hierarchies and link them with a pointer (composition).
// The Usage: Common in frameworks/libraries that interact with hardware, databases, or third-party APIs. Less common in standard day-to-day UI business logic.

// **Yes, exactly.**

// That is the primary structural purpose of the Bridge pattern. It prevents what is formally called "Class Explosion" or the "Cartesian Product" problem.

// Here is the math on why that matters as a project grows:

// **Scenario: You have 5 different Window Types (App, Icon, Dialog, Palette, Toast) and 4 different Platforms (Windows, Linux, Mac, Android).**

// **1. Without Bridge (Inheritance only)**
// You must create a specific class for every combination.
// *   Formula: $Types \times Platforms$
// *   Result: $5 \times 4 =$ **20 distinct classes**.
// *   *Maintenance Nightmare:* If you fix a bug in the "Linux" drawing code, you might have to paste that fix into 5 different files (LinuxApp, LinuxIcon, LinuxDialog, etc.).

// **2. With Bridge (Composition)**
// You create classes for the types, and classes for the platforms, and link them dynamically.
// *   Formula: $Types + Platforms$
// *   Result: $5 + 4 =$ **9 distinct classes**.
// *   *Maintenance Benefit:* If you fix a bug in the "Linux" drawing code, you fix it in **1 file** (`LinuxWindowImp`), and all 5 window types automatically get the fix.

// By separating the "Abstractions" (High-level Logic) from the "Implementations" (Low-level Details), you turn a multiplication problem into an addition problem.
