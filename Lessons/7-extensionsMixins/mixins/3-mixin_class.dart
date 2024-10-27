abstract mixin class Musician {
  abstract final String name;

  @override
  String toString() => '${this.runtimeType}($name)';
}

mixin class Artist {
  String? name;

  @override
  String toString() => 'Artist($name)';
}

class Guitarist extends Musician {
  final String name;
  Guitarist(this.name);
}

class Pianist with Musician {
  String _name;

  @override
  String get name => _name;

  Pianist({required String name}) : _name = name;

  @override
  String toString() => 'Pianist(name: $_name)';
}

void main() {
  final artist = Artist()..name = 'Michelangelo';

  final guitarist = Guitarist('Tim Henson');

  final pianist = Pianist(name: 'Ray Charles');

  print('great artist: $artist');

  print('great guitarist: $guitarist');

  print('great pianist: $pianist');
}
// Mixin Class

//   - a combination of a mixin and a class

//   - can do everything a mixin and a class can do but also has the restrictions of both

//   - can be extended

//   - can be instantiated

//   - mixins can't have extends or with clauses, so neither can a mixin class

//   - classes can't have an on clause, so neither can a mixin class

//   - can't have generative constructors

//   - mixin classes seem pretty limited in what they can do