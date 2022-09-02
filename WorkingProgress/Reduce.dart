// Reduce
//    - Used to combine all items inside a collection without using a for loop
//    - Produces a singe result

void main() {
  var intList = <int>[1, 2, 3, 4, 5];
  var reduction = intList.reduce((value, element) => value * element);
  print(reduction);
}
