/// The entry point to our program

void main() {
  List<String> heroNames = ['Goku', 'Naruto', 'Gon', 'Deku'];

  // Different ways to iterate through an arrays elements
  heroNames.forEach((h) => print(h.toLowerCase()));

  for (var hero in heroNames) {
    print(hero);
  }

  for (var i = 0; i < heroNames.length; i++) {
    print(heroNames[i].toUpperCase());
  }

  // Useful methods of a collection List/array

  // Adds a value to the end of an array
  heroNames.add('Vegeta');

  print(heroNames);

  // if the value exists return its index
  print(heroNames.indexOf('Goku'));

  // Returns false if the array is empty and true otherwise
  print(heroNames.isEmpty);

  // Inserts an element at a specified index location of an array
  heroNames.insert(0, 'Almight');
  print(heroNames[0]);

  // Removes an element at the specified index location
  print(heroNames);
  heroNames.removeAt(2);
  print(heroNames);

  // Boolean method that returns true
  // if the collection contains the element passed and false otherwise
  print(heroNames.contains('Freza'));
}
