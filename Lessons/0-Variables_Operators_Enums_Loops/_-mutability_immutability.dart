// Goal

//   - understand the difference between mutable and immutable objects

//   - understand what happens when there are multiple references
//     to the same object (two or more variables point to the same object / value)

void main() {
  // reassignable reference to an immutable object
  String hero = 'Katsuki';

  print('hero hashcode: ${hero.hashCode}');

  final heroHash01 = hero.hashCode;

  // assign new string to reassignable reference
  hero += ' ' 'Bakugo'; // hero = hero + 'Bakugo' means the same thing

  // Hash code changes representing a different string in memory
  print('hero hashcode after reassignment: ${hero.hashCode}');

  final heroHash02 = hero.hashCode;

  print(_doHashcodesMatch(heroHash01, heroHash02));

  // unreassignable reference to a mutable object (object has mutators)
  final List<String> heros = [];

  print('heros array hashcode: ${heros.hashCode}');

  final herosHash01 = hero.hashCode;

  // call mutator operation on array object
  heros.add('Shoto Todoroki');

  // assign a new refernce to the same mutable object
  final List<String> myHeros = heros;

  print('myHeros array hashcode: ${myHeros.hashCode}');

  // call mutator operation on array object, affecting all assigned refernces (variables pointing to the same location in memory)
  heros.add(hero);

  print('heros array hashcode after mutation: ${heros.hashCode}');

  print('myHeros array elements after mutation of heros array: $myHeros');

  final herosHash02 = hero.hashCode;

  print(_doHashcodesMatch(herosHash01, herosHash02));
}

String _doHashcodesMatch(int firstHash, int secondHash) {
  return 'do hash codes match: ${firstHash == secondHash}';
}

// Immutable Types

//   - instances of immutable types (objects) represent the same value once created

//   - they do not have mutator operations (methods) as part of their interface

// Mutable Types

//   - instances of mutable types have mutator operations (methods that change the value of the object)
