// We now have Destructuring

void main() {
  const List<int> arr = [1, 2, 3, 4, 5];
  var [_, x, _, y, _] = arr;

  print("$x * $y = ${x * y}");
}
