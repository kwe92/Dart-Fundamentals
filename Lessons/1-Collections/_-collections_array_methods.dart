/// The entry point to our program
void main() {
  List<String> heroNames = [
    'Goku',
    'Naruto',
    'Gon',
    'Deku',
  ];

  // Useful methods of a collection List/array

  print(heroNames);

  // if the value exists return its index
  print(heroNames.indexOf('Goku'));

  // Returns false if the array is empty and true otherwise
  print(heroNames.isEmpty);

  // Inserts an element at a specified index location of an array
  print(heroNames[0]);

  // Boolean method that returns true
  // if the collection contains the element passed and false otherwise
  print(heroNames.contains('Freza'));

  // Returns the length of the collection
  print(heroNames.length);

  // Create an array of numbers then sum them
  var myList = [1, 3, 5, 7, 9];
  print('\nThe sum of $myList is ${sum(myList)}\n');
}

int sum(List<int> iter) => iter.reduce((value, element) => value + element);
