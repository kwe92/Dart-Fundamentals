import 'dart:math';

class Hero {
  final String name;

  final String power;

  const Hero(this.name, this.power);

  @override
  String toString() => 'Hero(name: $name, power: $power)';
}

void main() {
  Hero hero;

  // Example: Known json Structure

  final json = {
    'hero': ['All Might', 'All-For-One']
  };

  final {'hero': [name, power]} = json;

  hero = Hero(name, power);

  print(hero);

  // Example: Validating External (Potentially Unkown) json Structure

  final externalJson = {
    'hero': [
      'Keigo Takami',
      Random().nextBool()
          ? 'Fierce Wings'
          : Random().nextBool()
              ? 9999
              : null
    ]
  };

  if (externalJson case {'hero': [String name, String power]}) {
    hero = Hero(name, power);

    print(hero);
  } else {
    print('invalid json structure: $externalJson');
  }

  for (var entry in externalJson.entries) {
    if ({entry.key: entry.value} case {'hero': [String name, String power]}) {
      hero = Hero(name, power);

      print(hero);
    } else {
      print('invalid json structure: $externalJson');
    }
  }
}

// Validating json Using Pattern Matching

//   - if the json structure is know then pattern matching is simple

//   - if the json structure is unknown then validation can be
//     achieved with a single case pattern

//   - single cases work best as if-case statements allowing you to
//     validate json in a declarative way with much less code

// if case statements

//   - Dart if statements with case clauses followed by a pattern and an optional guard clause

//   - A way to match and destructure an object against a single pattern