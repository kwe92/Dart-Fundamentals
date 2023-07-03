// TODO: review from the top

// HashMap: Iteration

void main() {
  Map<String, dynamic> hero = {
    'name': 'Killua',
    'age': 12,
    'anime': 'Hunter x Hunter',
    'friends': <String>['Gon', 'Kurapika', 'Leorio']
  };

  // keys property

  //   - returns all keys as elements of an Iterable Object

  final Iterable<String> keys = hero.keys;

  for (String key in keys) {
    print(key);
  }

  // value property

  //   - returns all values as Iterable

  Iterable<dynamic> values = hero.values;

  for (var val in values) {
    print(val);
    print(val.runtimeType);
  }

  // values can also be accessed with key and supscript

  for (var key in hero.keys) {
    print(hero[key]);
  }

  // entries property (MapEntry)

  //   - an Iterable object where its elements are MapEntry objects

// MapEntry Object

//   - represents a single entry of a Map

  for (MapEntry<String, dynamic> mapEntry in hero.entries) {
    print('key: ${mapEntry.key} | value: ${mapEntry.value}');
  }
  // forEach method

  hero.forEach(
    (key, value) => print('Key using forEach: $key | value using forEach: $value'),
  );
}
