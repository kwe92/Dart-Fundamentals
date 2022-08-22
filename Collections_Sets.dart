void main() {
  var set1 = {1, 2, 2, 3, 3, 4};
  var set2 = {2, 2, 4, 4, 6, 8};
  print('set1 elements: $set1');
  print('set2 elements: $set2');
  // Return items in both sets
  print('itersection of set1 and set2: ${set1.intersection(set2)}');
}
