// ignore_for_file: equal_elements_in_set

import 'dart:math';

// Sets: Set Theory

//   - collection of unique elements
//   - operations:
//       - union
//       - intersect
//       - difference (except)

void main() {
  var set1 = {1, 2, 2, 3, 3, 4};
  var set2 = {2, 2, 4, 4, 6, 8};
  print('set1 elements: $set1');
  print('set2 elements: $set2');

  // Return new Set with elements that are in both sets
  print('itersection of set1 and set2: ${set1.intersection(set2)}');

  // Return new Set with elements that are not in other set
  print('difference of set1 and set2: ${set1.difference(set2)}');

  // contains all unique elements in both sets
  print('union of set1 and set2: ${set1.union(set2)}');

  // Find the elements that belong to set1 or set2 but not both sets
  // Then print the sum of the resulting set

  set1 = randomSet(15) as Set<int>;
  set2 = randomSet(15) as Set<int>;

  print('Random set1 values: $set1');
  print('Random set2 values: $set2');
}

num sum(Iterable iter) => iter.toList().reduce(
      (value, element) => value + element,
    );

Set randomSet(int setLength) {
  Set set1 = {};
  final randInt = Random();
  for (var i = 0; i < setLength; i++) {
    set1.add(
      randInt.nextInt(
        15,
      ),
    );
  }
  return set1;
}
