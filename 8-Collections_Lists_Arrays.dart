/// The entry point to our program

void main() {
  // A vary commonly used collection is an Array
  // In the Dart programming language Arrays are represented as Lists
  // Lists in the dart programming are nonhomogeneous by default
  // You can declare and initialize a List as a homogeneous array by
  // being explicit using the following notation
  // List<data_type> myListVariableName = [n...list of correct data types];
  // <data_type> is type annotation
  List<String> heroNamesTest = ['Goku', 'Naruto', 'Gon', 'Deku'];

  // It is still better to use const, final and var for declaration
  // Allowing dart to infer the type
  // To use infered types and still make an Array homogeneous use the following notation
  const heroNames = <String>['Goku', 'Naruto', 'Gon', 'Deku'];

  // const makes the Array immutable but the error is only caught at runtime not compile time
  // heroNames[0] = 'Gohan'; // will result in a runtime error uncomment to see

  // Different ways to iterate through an arrays elements
  heroNames.forEach((element) => print(element.toLowerCase()));

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

  // Returns the length of the collection
  print(heroNames.length);

  // A method that removes all elements from the collection
  heroNames.clear();
  print(heroNames);
}
