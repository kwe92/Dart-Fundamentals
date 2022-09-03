// TODO: Add Explanatory Comments

import 'dart:math';

void main() {
  List<int> intList = randIntList(5, 10);
  var transList = transform<int, int>(intList, (x) => pow(x));
  print(intList);
  print(transList);
}

List<R> transform<T, R>(List<T> collection, R Function(T) f) {
  List<R> result = [
    for (var i = 0; i < collection.length; i++) f(collection[i])
  ];
  return result;
}

List<int> randIntList(var n, var r) {
  List<int> result = [for (var i = 0; i < n; i++) Random().nextInt(r)];
  return result;
}

int pow(var n, [var p = 2]) {
  if (p == 0) return 1;
  return n * pow(n, p - 1);
}
