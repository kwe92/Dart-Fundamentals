mixin Musician {
  // delared abstract (virtual) property requiring initialization by sub-classes
  String get name;

  // delared abstract (virtual) method requiring concrete implementation by sub-classes
  void playInstrument(String instrumentname);

  void playPiano() => playInstrument('Piano');

  void playFlute() => playInstrument('Flute');
}

// sub-class of Musician
class Virtuoso with Musician {
  // defining required field
  final String name;

  Virtuoso(this.name);

  // providing concrete implementation
  @override
  void playInstrument(String instrumentName) => print('$name plays the $instrumentName, with such beautiful passion!');
}

void main() {
  final musician = Virtuoso('Ronin Clark');

  musician.playPiano();

  musician.playFlute();
}

// Specify Members a mixin Can Call on Itself

//   - a mixin can not use a constructor to instantiate its own fields

//   - a mixin may depend on accessing a field or invoking a method
//     on itself that it can not define itself due to the inability to declare
//     generative constructors to initialize fields

//   - there are a few different strategies to ensure a sub-class of a mixin
//     defines and fields or methods the mixin depends on to function:

//       - declare abstract methods in a mixin that sub-claasses must implement (concrete implementation)

//       - define a getter for a property that will be required to be initialized in any sub-classes
//         the property can not be declared as final within the mixin and will be mutable
//         the sub class however has the the option of declaring the field immutable using final


