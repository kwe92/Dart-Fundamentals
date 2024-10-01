void main() {
  const myList = <String>['sky', 'cloud', 'sod', 'worm', 'put', 'water', 'cup'];

  final wordMap = <dynamic, String>{
    "i_come_first": 'first element',
    for (var i = 0; i < myList.length; i++)
      if (myList[i].length > 3) i: myList[i],
//    ^^^^^^^^^dynamic key^^^^^^^^^^  ^^dynamic value^^
    "i_come_last": 'last element',
  };
  print(wordMap);
}

// Hash Map: Collection-for

//   - you can use the collection-for syntax
//     to create key-values pairs of a hash map dynamically
//     with a Map literal