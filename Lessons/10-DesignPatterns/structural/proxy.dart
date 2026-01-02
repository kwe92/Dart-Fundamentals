import 'dart:io';

// TODO: add notes onthe Proxy pattern
class Point {
  final double x, y;
  const Point(this.x, this.y);
  static const zero = Point(0, 0);

  @override
  bool operator ==(covariant Object other) => other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Point($x, $y)';
}

class Event {
  final String type;
  Event(this.type);
}

class InputStream {
  final String _data;
  InputStream(this._data);
  String readString() => _data;
}

class OutputStream {
  void write(String data) {
    stdout.write(data);
  }
}

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

class Image extends Graphic {
  final String _fileName;

  Image(this._fileName) {
    // Simulating expensive initialization
    print("  [System] Loading heavy image file '$_fileName' from disk...");
  }

  @override
  void draw(Point at) {
    print("  [Image] Drawing '$_fileName' at $at");
  }

  @override
  void handleMouse(Event event) {
    print("  [Image] Handling event '${event.type}' in '$_fileName'");
  }

  @override
  Point getExtent() {
    // In a real scenario, this would calculate size based on the loaded image data
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

class ImageProxy extends Graphic {
  Image? _image; // The real subject (nullable for lazy loading)
  Point _extent;
  String _fileName;

  ImageProxy(this._fileName) : _extent = Point.zero;

  // Protected helper: Corresponds to ImageProxy::GetImage
  Image _getImage() {
    if (_image == null) {
      _image = Image(_fileName); // Lazy initialization happening here
    }
    return _image!;
  }

  @override
  Point getExtent() {
    // If we don't know the extent yet, we must load the real image to find out.
    if (_extent == Point.zero) {
      _extent = _getImage().getExtent();
    }
    return _extent;
  }

  @override
  void draw(Point at) {
    _getImage().draw(at);
  }

  @override
  void handleMouse(Event event) {
    _getImage().handleMouse(event);
  }

  @override
  void save(OutputStream to) {
    // Saves cached extent and filename without forcing image load
    // C++: to << _extent << _fileName;
    to.write("Extent: $_extent, File: $_fileName\n");
  }

  @override
  void load(InputStream from) {
    // Loads extent and filename
    // C++: from >> _extent >> _fileName;
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
      // This call triggers the Draw(), which triggers the Lazy Load in Proxy
      graphic.draw(const Point(10, 10));
    }
  }
}

// ---------------------------------------------------------------------------
// Main Execution
// ---------------------------------------------------------------------------

void main() {
  print("--- 1. Creating TextDocument ---");
  final text = TextDocument();

  print("\n--- 2. Inserting ImageProxy (Lazy Loading) ---");
  // We create the proxy. Notice "Loading heavy image..." does NOT appear yet.
  final proxy = ImageProxy("landscape.jpg");
  text.insert(proxy);
  print("(ImageProxy inserted. Real image has not been loaded yet.)");

  print("\n--- 3. Interacting with Proxy (Save/Load) ---");
  // We can save/load the proxy without loading the real image
  proxy.save(OutputStream());

  print("\n--- 4. Rendering Document (Triggering the Real Subject) ---");
  // This calls draw(), which calls _getImage(), which finally loads the Image
  text.renderDocument();

  print("\n--- 5. Rendering Again (Using Cached Subject) ---");
  // The image is already loaded, so it won't load again
  text.renderDocument();
}
