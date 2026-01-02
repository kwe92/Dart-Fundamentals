typedef Coord = double;

class Component {
  final Coord natural;
  final Coord stretch;
  final Coord shrink;

  Component(this.natural, this.stretch, this.shrink);
}

enum CompositorType { simple, tex, array }

class Composition {
  final CompositorType _type;
  final List<Component> _components = [];
  final int _arrayInterval;
  int _lineWidth = 100;
  List<int> _lineBreaks = [];

  int get lineWidth => _lineWidth;

  Composition(this._type, {int arrayInterval = 0}) : _arrayInterval = arrayInterval;

  void addComponent(Component c) => _components.add(c);

  void repair() {
    // 1. Prepare data (same as before)
    List<Coord> natural = _components.map((c) => c.natural).toList();
    List<Coord> stretch = _components.map((c) => c.stretch).toList();
    List<Coord> shrink = _components.map((c) => c.shrink).toList();
    int componentCount = _components.length;

    _lineBreaks.clear();

    switch (_type) {
      case CompositorType.simple:
        _performSimpleCompose(natural, stretch, shrink, componentCount);
        break;
      case CompositorType.tex:
        _performTeXCompose(natural, stretch, shrink, componentCount);
        break;
      case CompositorType.array:
        _performArrayCompose(natural, stretch, shrink, componentCount);
        break;
    }

    print("Layout complete. $_lineBreaks breaks generated.\n");
  }

  // Logic moved from SimpleCompositor class
  void _performSimpleCompose(List<Coord> natural, List<Coord> stretch, List<Coord> shrink, int count) {
    print("SimpleCompositor logic: Calculating breaks (ignoring stretchability)...");
    // Logic implementation...
  }

  // Logic moved from TeXCompositor class
  void _performTeXCompose(List<Coord> natural, List<Coord> stretch, List<Coord> shrink, int count) {
    print("TeXCompositor logic: Calculating breaks globally (using all metrics)...");
    // Logic implementation...
  }

  // Logic moved from ArrayCompositor class
  void _performArrayCompose(List<Coord> natural, List<Coord> stretch, List<Coord> shrink, int count) {
    // We have to access the class-level variable _arrayInterval here
    print("ArrayCompositor logic: Breaking at fixed interval $_arrayInterval...");
    // Logic implementation...
  }
}

void main() {
  // 1. Simple Mode
  // We pass an enum instead of a behavior object.
  Composition quick = Composition(CompositorType.simple);
  quick.addComponent(Component(10, 2, 1));
  quick.repair();

  // 2. TeX Mode
  Composition slick = Composition(CompositorType.tex);
  slick.addComponent(Component(10, 5, 2));
  slick.repair();

  // 3. Array Mode
  // We have to pass the interval to the Composition constructor,
  // even though 'quick' and 'slick' didn't need it.
  Composition iconic = Composition(CompositorType.array, arrayInterval: 100);
  iconic.addComponent(Component(10, 0, 0));
  iconic.repair();
}

// Changes made to strategy.dart for comparison:

//  - Enum to define the desired behavior types
//    Previously, these were separate classes

// The Context

//  - now becomes a "Monolithic" class
//    It contains all the logic for every possible layout algorithm

// STATE POLLUTION:

//  - We must store state in thr Context that is only relevant to one specific algorithm
//    '_arrayInterval' is only needed for CompositorType.array

//  - The other types don't care about it, but the class must hold it

// CONDITIONAL LOGIC (The anti-pattern replacement):

//  - Instead of _compositor.compose(...), we have to explicitly check the type
//    if we want to add a new algorithm, we must modify this class (Violating Open/Closed Principle)
