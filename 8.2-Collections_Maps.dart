/// The entry point to our program
void main() {
  // Maps are collections that contain key, value pairs
  // Using type annotation can be used with Maps
  // Maps are also known as dictionaries in other languages
  Map<String, dynamic> hero = {
    'Name': 'Gon',
    'Age': 12,
    'Anime': 'Hunter x Hunter',
    'Friends': <String>['Killua', 'Kurapika', 'Leorio']
  };

  print('The main character of ${hero['Anime']} is ${hero['Name']}');

  // iterating through Maps
  // Accessing the keys of a Map and iterate through them with a for loop
  for (var key in hero.keys) {
    print(key);
  }

  // values can also be access through iteration
  for (var val in hero.values) {
    print(val);
    print(val.runtimeType);
  }

  // values can also be accessed using the key and supscript
  for (var key in hero.keys) {
    print(hero[key]);
  }

  // Both keys and values can be accessed via the .entries iterable
  for (var entry in hero.entries) {
    print('key: ${entry.key} | value: ${entry.value}');
  }
  // the .forEach method is also available
  hero.forEach((key, value) {
    print('Key using forEach: $key | value using forEach: $value');
  });
}
