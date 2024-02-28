// ignore_for_file: equal_elements_in_set

import 'dart:math';

// Sets: Set Theory

//   - collection of unique elements
//   - operations:
//       - union
//       - intersect
//       - difference (except)

// Sets in Dart

//   - a programmatic representation and implementation of a mathematical set

//   - generic in nature i.e. parameterized type literal <T>{T0, T1, T2, ..., Tn}

//   - if the type is omitted during instantiation then the set is heterogeneous (dynamic type) by default
//     which means the types are unknown until compile time i.e. you will not have access to object behaviours (methods)

//   - set indecies map to the set of whole numbers W e.g. {0, 1, 2, ..., n}

//   - like all collections in dart, sets can be divided into two categories:

//      ~ Mutable Sets | imperatively modifiable (any set not prefixed with const)

//      ~ Immutable Sets | unmodifiable Sets | Frozen Sets (any set prefixed with const) | (note: unmodifiable Sets can not have duplicates at compile time)

// Mathematical Set Categories

//   - empty set {} (a set containing zero elements)
//   - singleton set {1} (a set containing one element)
//   - set {1,-11,12,...,n} (a set containing two or more possibly infinite elements)

// Set Subscript in Dart

//   - By default the subscript operator is not implemented on Sets in dart
//   - with the extension keyword the afromentioned problem is easily resolved as shown bellow

extension SubScript<E> on Set<E> {
  // get element at subscript
  Set<E> operator [](int index) => {this.elementAt(index)};

  // update at subscript
  void operator []=(int index, E other) {
    List<E> arr0 = this.toList();
    arr0.insert(index, other);
    arr0.removeAt(index + 1);
    this.clear();
    this.addAll(arr0);
  }
}

void main() {
  Set<int> set1 = {1, 2, 2, 3, 3, 4};

  Set<int> set2 = {2, 2, 4, 4, 6, 8};

  Set<int> set3 = {for (int ele in set2) ele * 2};

  print('set1 elements: $set1');
  print('set2 elements: $set2');
  print('set3 elements: $set3');

  // Return new Set with elements that are in both sets
  print('itersection of set1 and set2: ${set1.intersection(set2)}');

  // Return new Set with elements that are not in other set
  print('difference of set1 and set2: ${set1.difference(set2)}');

  // contains all unique elements in both sets
  print('union of set1 and set2: ${set1.union(set2)}');

  set1 = randomSet(15);
  set2 = randomSet(15);
  var x = 42;

  print('Random set1 values: $set1');
  print('Assign value $x at subscript 0 within set2: ${set2[0] = x}');
  print('Random set2 values: $set2');
}

num sum(Iterable iter) => iter.toList().reduce(
      (value, element) => value + element,
    );

Set<int> randomSet(int setLength) {
  Set<int> set1 = {};
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
