int main() {
  const List<int> arr1 = [1, 2, 3];

  const List<int> arr2 = [4, 5, 6];
  final List<int> arr3 = [
    for (int a in arr1)
      for (int b in arr2) a * b
  ];

  print(arr3);
  return 0;
}
