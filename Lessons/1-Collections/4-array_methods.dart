/// The entry point to our program
/// todo: add .addAll
void main() {
  const List<String> heroNames = [
    'Goku',
    'Naruto',
    'Gon',
    'Deku',
  ];

  // some methods of Lists

  print(heroNames);

  // if value exists return its index
  print(
    heroNames.indexOf('Goku'),
  );

  // Returns false if array is empty, true otherwise
  print(heroNames.isEmpty);

  // Insert element at specified index location of array
  print(heroNames[0]);

  // if element exsits return true otherwise false
  print(heroNames.contains('Freza'));

  // Returns length of collection
  print(heroNames.length);
}
