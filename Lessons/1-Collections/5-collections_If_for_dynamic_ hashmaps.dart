// TODO: Check out map docs and expand onthe lesson

// Dynamic hashmap

void main() {
  const myList = <String>[
    'sky',
    'cloud',
    'sod',
    'worm',
    'put',
    'water',
    'cup',
  ];

  var i = 0;

// elements can be predicates in Iterables
// creating elements dynamily

  final wordMap = {
    "i_come_first": 'first element',
    for (var w in myList)
      if (w.length >= 3) i++: w,
    "i_come_last": 'second element',
  };
  print(wordMap);
}
