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
    if (!_existing(charCode)) {
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

  bool _existing(int key) => _characters.containsKey(key);
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

  final _fonts = <int, Font>{};
  final _defaultFont = Font("System-Default-12");

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
    glyphFactory.createCharacter(99), // 'c'
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

// 1. Core Identity

      // Pattern Name: Flyweight
      // Category: Structural (Object)
      // Intent: Use sharing to support large numbers of fine-grained objects efficiently.

// 2. The Problem & Solution (Motivation)

      // Scenario: Applications like text editors or game engines that require huge numbers of
      // objects (e.g., a character object for every letter in a book).
      // Problem: Creating a distinct object instance for every item consumes prohibitive amounts
      // of memory and incurs runtime overhead.
      // Solution: Create a "pool" of shared objects. Separate the data that is common to all
      // instances (Intrinsic) from the data that is unique to specific instances (Extrinsic).

// 3. The Key Concept: State Splitting

      // Intrinsic State:

            // - Information that is independent of the object's context.
            // - Stored permanently inside the Flyweight object.
            // - Example: The character code 'a' (it is always 'a' regardless of where it appears).

      // Extrinsic State:

            // - Information that depends on and varies with the object's context.
            // - NOT stored in the Flyweight.
            // - Passed to the Flyweight by the Client during method calls.
            // - Example: The (x,y) position, the font color, or the font size.

// 4. Participants

      // Flyweight (Glyph):

            // - Declares an interface through which flyweights can receive and act on extrinsic state.

      // ConcreteFlyweight (Character):

            // - Implements the Flyweight interface.
            // - Stores Intrinsic state.
            // - Must be sharable.

      // UnsharedConcreteFlyweight (Row, Column):

            // - Not all subclasses need to be shared (e.g., container objects that hold Flyweights).

      // FlyweightFactory:

            // - Creates and manages flyweight objects.
            // - Ensures proper sharing (returns an existing instance if available, or creates a new one).

      // Client:

            // - Maintains references to flyweights.
            // - Computes or stores the Extrinsic state.

// 5. Applicability

// Apply this pattern only when ALL of the following are true:

      // - The application uses a huge number of objects.
      // - Storage costs are high.
      // - Most object state can be made extrinsic.
      // - The application does not depend on object identity (since the same object instance
      //   represents multiple distinct logical entities).

// 6. Consequences

      // Pros:

           // - Drastic reduction in memory usage.

      // Cons:

            // - Runtime cost: Computing and passing extrinsic state takes CPU time.
            // - Complexity: The code logic becomes more complex as state is separated.

// 7. Sample Code Use Case & Analysis

      // Scenario: A Document Editor rendering the text "aa bb".
      // The application needs to draw characters on a window but wants to avoid creating
      // a heavy object for every single letter on the screen.

      // Memory Efficiency (The Result):

            // - The input string "aa bb" has 5 characters (plus a 6th 'c' in the code).
            // - Without Flyweight: 6 distinct objects created.
            // - With Flyweight: Only 4 objects created ('a', ' ', 'b', 'c').
            // - The Factory detects that 'a' and 'b' already exist and returns the existing pointer.

      // Separation of Concerns:

            // - Intrinsic: The Character class is tiny. It only knows it is the letter 'a'.
            // - Extrinsic: The GlyphContext acts as the repository for the "expensive" data
            //   (Fonts, Styles, Positions).
            // - The draw() method acts as the bridge: The Client (main) tells the Context
            //   to set the Font, then passes that Context to the Character.

      // The Factory Mandate:

            // - Critical Requirement: Clients must NOT instantiate ConcreteFlyweights directly
            //   (e.g., new Character('a')).
            // - They must go through GlyphFactory.createCharacter('a') to ensure the
            //   pooling/caching logic is executed.
