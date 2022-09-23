// Using the words:
// create an array of the afromentioned words
// iterate through the array and add words to the map
// Whose length is 3 or greater with there own numeric key
// The key of each word should increment by 1 starting at 0

/// The entry point to any program.
void main() {
  // compile time constant
  // Defining the type of each element within the list explicitly
  const myList = <String>['sky', 'cloud', 'sod', 'worm', 'put', 'water', 'cup'];

  // infered variable
  var i = 0;

  // infere map variable
  var wordMap = {
    // for every element in myList
    //    if that element has a length greater than or equal to 3
    //    Add a numeric key starting at 0 and its value is the word
    //    with the afromentioned stipulations
    for (var w in myList)
      if (w.length >= 3) i++: w
  };
  print(wordMap);
}
