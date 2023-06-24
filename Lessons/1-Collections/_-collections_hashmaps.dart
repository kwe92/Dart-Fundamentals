// Maps: hash maps

//  - collections containing key, value pairs
//  - O(1 + α) constant time:
//      - insert
//      - update
//      - delete

//  - null value returned for non-existing keys

void main() {
  Map<String, dynamic> hero = {
    'name': 'Gon',
    'age': 12,
    'anime': 'Hunter x Hunter',
    'friends': <String>['Killua', 'Kurapika', 'Leorio']
  };

  final enemies = hero['enemies'];

  print("enemies: $enemies");

  print('The main character of ${hero['Anime']} is ${hero['Name']}');
}
