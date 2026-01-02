
// Glyph Base Class (The Flyweight Interface)
abstract class Glyph {
  // Operations receive extrinsic state (Context)
  void draw(Window window, GlyphContext context);

  void setFont(Font font, GlyphContext context) {
    context.setFont(font);
  }

  Font getFont(GlyphContext context) {
    return context.getFont();
  }

  void first(GlyphContext context) {}
  void next(GlyphContext context) {}
  bool isDone(GlyphContext context) => true;
  Glyph? current(GlyphContext context) => null;

  void insert(Glyph glyph, GlyphContext context) {}
  void remove(GlyphContext context) {}
}

// Concrete Flyweight
class Character extends Glyph {
  final int _charCode;

  Character(this._charCode);

  @override
  void draw(Window window, GlyphContext context) {
    // 1. Get the extrinsic state (Font) from the Context
    final font = context.getFont();

    // 2.intrinsic state (charStr)
    final charStr = String.fromCharCode(_charCode);
    window.addText(charStr, font.name);
  }
}

// Composite Glyphs (Row/Column)

class Row extends Glyph {
  @override
  void draw(Window window, GlyphContext context) {
    // Implementation omitted for brevity
  }
}

class Column extends Glyph {
  @override
  void draw(Window window, GlyphContext context) {
    // Implementation omitted for brevity
  }
}

class GlyphFactory {
  final Map<int, Character> _characters = {};

  GlyphFactory();

  Character createCharacter(int charCode) {
    if (!_characters.containsKey(charCode)) {
      _characters[charCode] = Character(charCode);
      print("  [Factory] Created new object for character code: $charCode ('${String.fromCharCode(charCode)}')");
    } else {
       print("  [Factory] Reusing existing object for character code: $charCode ('${String.fromCharCode(charCode)}')");
    }

    return _characters[charCode]!;
  }

  Row createRow() {
    return Row();
  }

  Column createColumn() {
    return Column();
  }
}

class Window {
  void addText(String text, String fontInfo) {
    print("  [Window] Drawing '$text' using font: $fontInfo");
  }
}

class Font {
  final String name;
  Font(this.name);
  
  @override
  String toString() => name;
}

// GlyphContext (Repository of Extrinsic State)
class GlyphContext {
  int _index = 0;

  final  _fonts = <int, Font>{};
  final  _defaultFont = Font("System-Default-12");

  int get currentIndex => _index;

  GlyphContext();

  void next([int step = 1]) {
    _index += step;
  }

  void insert([int quantity = 1]) {
    _index += quantity;
  }

  Font getFont() {
    for (int i = _index; i >= 0; i--) {
      if (_fonts.containsKey(i)) {
        return _fonts[i]!;
      }
    }
    return _defaultFont;
  }

  void setFont(Font font) {
    _fonts[_index] = font;
  }
  
}

void main() {
  print("--- Initializing Factory ---");
  final glyphFactory = GlyphFactory();
  final context = GlyphContext();
  final window = Window();

  // Define some fonts
  final times12 = Font("Times-Roman-12");
  final italic12 = Font("Times-Italic-12");

  print("\n--- Creating Flyweights (String: 'aa bb') ---");
  final document = <Character>[
    glyphFactory.createCharacter(97), // 'a'
    glyphFactory.createCharacter(97), // 'a' - should reuse
    glyphFactory.createCharacter(32), // ' '
    glyphFactory.createCharacter(98), // 'b'
    glyphFactory.createCharacter(98), // 'b' - should reuse
    glyphFactory.createCharacter(99), // 'b' - should reuse

  ];

  print("\n--- Setting up Context (Extrinsic State) ---");
  context.setFont(times12); 

  print("\n--- Drawing Document ---");
  
  for (int i = 0; i < document.length; i++) {
    print(context.currentIndex);
    print(context.getFont());

    if (i == 2) {
      context.setFont(italic12);
    }

    document[i].draw(window, context);

    context.next();
  }
}

// TODO: Review and edit the notes below

// 1. Classification & Intent
// Type: Object Structural.
// Intent: Use sharing to support large numbers of fine-grained objects efficiently.

// 2. Core Concept: State Separation
// The most critical aspect of this pattern is distinguishing between two types of state:
// Intrinsic State:
//   Stored inside the Flyweight.
//   Independent of context.
//   Sharable (e.g., the character code 'A').
// Extrinsic State:
//   Stored or computed by the Client.
//   Depends on context.
//   Not shared.
//   Passed to the Flyweight as arguments during method calls (e.g., position x,y, font color).

// 3. Participants
// Flyweight (Interface): Declares methods that accept extrinsic state.
// ConcreteFlyweight: Implements the interface and stores intrinsic state. Must be sharable.
// UnsharedConcreteFlyweight: Subclasses that are not shared (often composites like a "Row" or "Column" that contain Flyweights).
// FlyweightFactory:
//   Creates and manages the pool of flyweights.
//   Ensures proper sharing (returns an existing instance if available).
// Client:
//   Maintains references to flyweights.
//   Computes/stores extrinsic state.
//   Rule: Must access ConcreteFlyweights only through the Factory.

// 4. Applicability (The 5 Prerequisites)
// Apply this pattern only when all of the following are true:
//   The app uses a large number of objects.
//   Storage costs are high due to the quantity.
//   Most object state can be made extrinsic.
//   Many groups of objects can be replaced by few shared objects.
//   The application does not rely on object identity (since distinct conceptual objects will share the same physical instance).

// 5. Classic Example
// Text Editor:
//   Instead of creating an object for every character in a document (too expensive), create one Flyweight for each letter of the alphabet.
//   Intrinsic: Character code.
//   Extrinsic: Font, position, color (passed in by the layout manager).

// 6. Consequences (Trade-offs)
// Benefit: significant reduction in memory usage (Space savings).
// Cost: potential runtime overhead (CPU) to calculate or transfer extrinsic state.
// Identity: a == b may return true even if a and b are conceptually different characters in different locations.