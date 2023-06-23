/// The entry point to our program

void main() {
  // TODO: go over again and make more concise
  // Lists

  //   - arrays are 0-based indexed data structures
  //       - index one-to-one correspondence with Whole numbers {0, 1, 2, 3,...}
  //   - non-homogeneous by default

  // const arrays are frozen at compile-time

  const List<String> heroNamesTest = ['Goku', 'Naruto', 'Gon', 'Deku'];

  try {
    // a run-time error is thrown
    heroNamesTest[3] = 'Almight';
  } catch (errorMessage, stackTrace) {
    print('Error Message: $errorMessage');
  } finally {
    print('Some anime charaters $heroNamesTest');
  }

  // mutable if final or const is omitted

  List<String> heroNames = ['Goku', 'Naruto', 'Gon', 'Deku'];

// Iterable iteration

  // forEach
  heroNames.forEach(
    (element) => print(
      element.toLowerCase(),
    ),
  );

  // for-in
  for (var hero in heroNames) {
    print(hero);
  }
  // for loop
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

  // Create an array of numbers then sum them
  var myList = [1, 3, 5, 7, 9];
  print('The sum of $myList is ${sum(myList)}');
}

int sum(List<int> iter) => iter.reduce((value, element) => value + element);
