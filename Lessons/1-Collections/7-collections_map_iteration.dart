// TODO: review from the top

// HashMap: Iteration

// key property

//   - returns all keys in a Iterable
void main() {
  Map<String, dynamic> hero = {
    'name': 'Killua',
    'age': 12,
    'anime': 'Hunter x Hunter',
    'friends': <String>['Gon', 'Kurapika', 'Leorio']
  };

  // for-in loop

  // keys property

  //   - returns all keys as Iterable

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

  // entries property

  //   - keys and values can be accessed via entries Iterable

  for (MapEntry<String, dynamic> entry in hero.entries) {
    print('key: ${entry.key} | value: ${entry.value}');
  }
  // forEach method

  hero.forEach(
    (key, value) => print('Key using forEach: $key | value using forEach: $value'),
  );
}
