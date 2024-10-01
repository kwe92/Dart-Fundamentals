// HashMap: Iteration

void main() {
  var hero = <String, dynamic>{
    'name': 'Killua',
    'age': 12,
    'anime': 'Hunter x Hunter',
    'friends': <String>['Gon', 'Kurapika', 'Leorio']
  };

  final keys = hero.keys;

  print('hero map keys:\n');
  for (String key in keys) {
    print('$key\n');
  }

  final values = hero.values;

  print('hero map values:\n');
  for (var val in values) {
    print('$val\n');
    print('element runt-time type: ${val.runtimeType}\n');
  }

  // values can be accessed with key and sub-script
  print('accessing hash map values with key and sub-script:\n');
  for (var key in hero.keys) {
    print('${hero[key]}\n');
  }

  print('accessing hash map entries property:\n');
  for (var mapEntry in hero.entries) {
    print('map entry: $mapEntry\n');

    print('key: ${mapEntry.key} | value: ${mapEntry.value}\n');
  }

  hero.forEach(
    (key, value) => print('Key using forEach: $key | value using forEach: $value'),
  );
}

// keys property

//   - returns all keys of a hash map as an Iterable object

// value property

//   - returns all values of a hash map as an Iterable object

// entries property (MapEntry)

//   - an Iterable object where its elements are MapEntry objects

//   - each MapEntry object represents a single key-value pair in a hash nap

// MapEntry Object

//   - represents a single entry of a Map

// forEach method

//   - Applies [action / callback function] to each key/value pair of the map