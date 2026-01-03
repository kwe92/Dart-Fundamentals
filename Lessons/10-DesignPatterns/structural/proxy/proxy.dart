import 'helper_classes.dart';

// ---------------------------------------------------------------------------
// 1. The Interface (Graphic)
// ---------------------------------------------------------------------------

abstract class Graphic {
  void draw(Point at);
  void handleMouse(Event event);
  Point getExtent();
  void load(InputStream from);
  void save(OutputStream to);
}

// ---------------------------------------------------------------------------
// 2. The Real Subject (Image)
// ---------------------------------------------------------------------------

class Image implements Graphic {
  final String _fileName;

  Image(this._fileName) {
    print("  [System] Loading heavy image file '$_fileName' from disk...");
  }

  @override
  Future<void> draw(Point at) async {
    print("  [Image] Drawing '$_fileName' at $at");
    await Future.delayed(const Duration(seconds: 2), () {
      print("  [Image] Finished drawing '$_fileName'");
    });
  }

  @override
  void handleMouse(Event event) {
    print("  [Image] Handling event '${event.type}' in '$_fileName'");
  }

  @override
  Point getExtent() {
    return const Point(1920, 1080);
  }

  @override
  void load(InputStream from) {
    print("  [Image] Loading data from stream");
  }

  @override
  void save(OutputStream to) {
    print("  [Image] Saving data to stream");
  }
}

// ---------------------------------------------------------------------------
// 3. The Proxy (ImageProxy)
// ---------------------------------------------------------------------------

class ImageProxy implements Graphic {
  Image? _image;
  Point _extent;
  String _fileName;

  ImageProxy(this._fileName) : _extent = Point.zero;

  Image _getImage() {
    if (_image == null) {
      _image = Image(_fileName); // Lazy initialization
    }
    return _image!;
  }

  @override
  Point getExtent() {
    if (_extent == Point.zero) {
      _extent = _getImage().getExtent();
    }
    return _extent;
  }

  @override
  Future<void> draw(Point at) async {
    await _getImage().draw(at);
  }

  @override
  void handleMouse(Event event) {
    _getImage().handleMouse(event);
  }

  @override
  void save(OutputStream to) {
    to.write("Extent: $_extent, File: $_fileName\n");
  }

  @override
  void load(InputStream from) {
    print("  [Proxy] Loading metadata from stream: ${from.readString()}");
  }
}

// ---------------------------------------------------------------------------
// 4. The Client (TextDocument)
// ---------------------------------------------------------------------------

class TextDocument {
  final List<Graphic> _graphics = [];

  void insert(Graphic graphic) {
    _graphics.add(graphic);
  }

  void renderDocument() {
    print("Rendering Document Page...");
    for (var graphic in _graphics) {
      graphic.draw(const Point(10, 10));
    }
  }
}

void main() {
  final text = TextDocument(); // creating document

  final proxy = ImageProxy("landscape.jpg"); // creating proxy

  text.insert(proxy); // inserting proxy into document

  proxy.save(OutputStream()); // saving proxy state

  text.renderDocument(); // rendering document (this will load the real image)

  text.renderDocument(); // rendering document again (real image is already loaded)
}

// 1. Core Identity

      // Pattern Name: Proxy
      // Category: Structural (Object)
      // Also Known As: Surrogate
      // Intent: Provide a surrogate or placeholder for another object to control access to it.

// 2. The Problem & Solution (Motivation)

      // Scenario: A document editor with large images. Loading all high-res images immediately
      // when opening the document is slow and consumes memory ("expensive objects").
      // Problem: The cost of creating objects should be deferred until they are actually needed
      // (visible on screen). The client code shouldn't know about this optimization.
      // Solution: Use an ImageProxy that acts as a stand-in. It shares the same interface
      // as the Image. It holds a lightweight reference (filename, extent) and only creates
      // the Real Image when Draw() is called.

// 3. Participants

      // Subject (Graphic):

            // - Defines the common interface for RealSubject and Proxy.
            // - Allows Proxy to be used anywhere a RealSubject is expected.

      // RealSubject (Image):

            // - Defines the real object that the proxy represents.

      // Proxy (ImageProxy):

            // - Maintains a reference to the RealSubject (or handles to find/create it).
            // - Controls access to the real subject (creation, deletion, auth checks).
            // - Identical interface to Subject.

// 4. Types of Proxies (Crucial List)

      // A. Remote Proxy: Represents an object in a different address space (Remote RPC).
      // Hides network communication details.
      // B. Virtual Proxy: Creates expensive objects on demand (Lazy Initialization).
      // C. Protection Proxy: Controls access based on permissions (Auth checks).
      // D. Smart Reference: Performs additional actions when an object is accessed
      // (e.g., Reference counting, thread locking).

// 5. Consequences & Optimizations

      // Indirection: Introduces a level of indirection which allows hiding location,
      // optimization (lazy load), or housekeeping tasks.
      // Copy-on-Write: An optimization related to creation on demand. A proxy can delay
      // copying a heavyweight object until the client actually modifies it. If only read
      // operations occur, the copy cost is saved.

// 6. Comparison with Related Patterns

      // Adapter: Provides a DIFFERENT interface to the object it adapts. Proxy provides
      // the SAME interface.
      // Decorator: Adds responsibilities (like a border). Proxy controls access.
      // Decorator references the object directly; Remote Proxy might only have an ID.

// 7. Sample Code Use Case & Analysis

      // Scenario: Lazy Loading Images in a Text Document.

      // Lazy Initialization Logic (The "Magic"):

            // - The `ImageProxy` class implements `Graphic` just like `Image`.
            // - It holds a nullable `Image? _image`.
            // - In the `draw()` method, it checks: `if (_image == null) _image = Image(...)`.
            // - This ensures the expensive constructor (Loading from disk) is only called
            //   in step 4 of the main function, not step 2.

      // Client Transparency:

            // - The `TextDocument` works with a list of `Graphic` objects.
            // - It does not know (and doesn't care) that one of them is a Proxy.
            // - It simply calls `.draw()`, and the Proxy handles the complex loading logic behind the scenes.
