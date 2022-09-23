// Named extensions with generic types
// extend methods that don't exist in a type / class
// it seems like if you extend a base clase you extend all of its children

// Using generic type constraint with named extensions
//  - when you want an extension to apply to all subclasses of a specific class
//  - sum should only work on numbers so the generic type extends num
//  - if <T extends num> was ommited and we used just <T>
//    we are using <T extends Object> by default
//    meaning that the extension will be valid for any type

extension ListX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => (value + element) as T);
}

int main() {
  final sumOfList = {1, 2, 3.5, 4.8, 5.04325}.sum();
  final Map<int, num> myMap = {0: 23, 1: 44.545, 2: 5.342, 3: 98};

  print(sumOfList);
  // Since the .values of a Map returns an Iterable type / class
  // we can use the sum() method extension
  print(myMap.values.sum());

  return 0;
}
