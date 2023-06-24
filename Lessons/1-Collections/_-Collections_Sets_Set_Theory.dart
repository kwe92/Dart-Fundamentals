// ignore_for_file: equal_elements_in_set

import 'dart:math';

void main() {
  // Sets are collections in the dart programming language
  // The are considered unique Lists that can not contain duplicate values
  // Sets also adhere to set theory principles union, intersect, difference (except)
  var set1 = {1, 2, 2, 3, 3, 4};
  var set2 = {2, 2, 4, 4, 6, 8};
  print('set1 elements: $set1');
  print('set2 elements: $set2');

  // Return items in both sets
  print('itersection of set1 and set2: ${set1.intersection(set2)}');

  // Find the elements that belong to set1 or set2 but not both sets
  // Then print the sum of the resulting set

  set1 = randomSet(15) as Set<int>;
  set2 = randomSet(15) as Set<int>;

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
