import 'dart:math';

void main() {
  // Create an array of numbers then sum them
  var myList = [1, 3, 5, 7, 9];
  print('The sum of $myList is ${sum(myList)}');

  // Find the intersection of two sets, print the intersection
  // Then print the sum of the intersection

  var set1 = randomSet(15);
  var set2 = randomSet(15);

  print('Random set1 values: $set1');
  print('Random set2 values: $set2');
  setIntersectAdd(set1, set2);
}

num sum(var iter) {
  num result = 0;
  for (var ele in iter) {
    result += ele;
  }
  return result;
}

// High order function
void setIntersectAdd(var a, var b) {
  var intersect_set = a.intersection(b);
  print('The intersection of $a and $b is: $intersect_set');
  print('The sum of $intersect_set is ${sum(intersect_set)}');
}

Set randomSet(int setLength) {
  Set set1 = {};
  final randInt = Random();
  for (var i = 0; i < setLength; i++) {
    set1.add(randInt.nextInt(15));
  }
  return set1;
}
