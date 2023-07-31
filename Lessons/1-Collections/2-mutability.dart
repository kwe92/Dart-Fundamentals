void main() {
  // mutable if:

  //  - var keyword used
  //  - final or const is omitted

  List<String> heroNames = [
    'Goku',
    'Naruto',
    'Gon',
    'Deku',
  ];

  // add value to end of array
  heroNames.add('Vegeta');

  // insert element at specified index,
  // shifting ALL elements O(n) linear time complexity
  heroNames.insert(0, 'Almight');

  // removes an element at a specified index location O(n)
  print(heroNames);
  heroNames.removeAt(2);
  print(heroNames);

  // removes all elements from a growable List
  heroNames.clear();
  print(heroNames);
}
