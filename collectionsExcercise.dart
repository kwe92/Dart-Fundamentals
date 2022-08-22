import 'dart:math';

void main() {
  // Create an array of numbers then sum them
  var myList = [1, 3, 5, 7, 9];
  print('The sum of $myList is ${sum(myList)}');

  // Find the erlements that belong to set1 or set2 but not both sets
  // Then print the sum of the resulting set

  var set1 = randomSet(15);
  var set2 = randomSet(15);

  print('Random set1 values: $set1');
  print('Random set2 values: $set2');
  setFunc(set1, set2);
}

num sum(var iter) {
  num result = 0;
  for (var ele in iter) {
    result += ele;
  }
  return result;
}

// High order function
void setFunc(var a, var b) {
  var intersect_set = a.intersection(b);
  var union_set = a.union(b);
  var result = union_set.difference(intersect_set);
  print('The diffrence of $union_set and $intersect_set is: $result');
  print('The sum of $result is ${sum(result)}');
}

Set randomSet(int setLength) {
  Set set1 = {};
  final randInt = Random();
  for (var i = 0; i < setLength; i++) {
    set1.add(randInt.nextInt(15));
  }
  return set1;
}
