extension ListX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => (value + element) as T);
}

void main() {
  final sumOfList = {1, 2, 3.5, 4.8, 5.04325}.sum();
  final myMap = {0: 23, 1: 44.545, 2: 5.342, 3: 98};

  print(sumOfList);

  print(myMap.values.sum());
}


// Generic Extensions

//   - extensions with parameterized type parameters

//   - can add additional functionality to collections and generic classes