// TODO: Continue working on generics until you fully unserstand
// TODO: Duplicate the doubleItems function and refactor it into the transform function using generic types

// Generics
//    - Reduce code duplication
//    - Helps write type safe code
void main() {
  const myList = [1, 2, 3];
  final List<double> transformedList =
      myList.map((element) => pow(element, 3).toDouble()).toList();
  print('Transformed list using .map method: $transformedList');

  final List<int> transformedList2 = doubleItems(myList);

  print('Transformed list2 using a function call: $transformedList2');
}

// Doubles the items in a list and returns a list
// returns a new transformed list
List<int> doubleItems(List<int> list) {
  final result =
      <int>[]; // initialize a new empty array restricted to intergers only
  for (var element in list) result.add(element * 2);
  return result;
}

/// Returns the power p of the number n passed
num pow(var n, var p) {
  if (p == 0) return 1;
  return n * pow(n, p - 1);
}
