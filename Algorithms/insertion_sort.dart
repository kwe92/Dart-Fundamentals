void main() {
  const List<int> arr = [5, 2, 4, 6, 1, 3];

  final arr2 = insertionSort(arr);

  print(arr2);
}

List<int> insertionSort(List<int> arr) {
  final length = arr.length;
  final a = [...arr];
  for (int i = 1; i < length; i++) {
    print('i: $i');

    int key = a[i];

    print('Key: $key');

    int j = i - 1;

    print('j: $j');

    while (j >= 0 && a[j] > key) {
      a[j + 1] = a[j];

      print('arr[j]: ${a[j]}');

      j = j - 1;
      print('j: $j');
    }
    a[j + 1] = key;

    print('a: $a');
  }
  return a;
}
