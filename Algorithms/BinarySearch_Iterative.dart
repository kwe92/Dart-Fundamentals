import 'dart:math';

int binarySearch(List arr, int low, int high, num x) {
  while (high >= low) {
    var mid = low + ((high - low) / 2).floor();
    if (arr[mid] == x) {
      return mid;
    }
    if (x < arr[mid]) {
      high = mid - 1;
    } else
      low = mid + 1;
  }
  return -1;
}

List<int> getRandom({required int length, int maxRange = 5}) {
  final Random rand = Random();
  final List<int> result = [
    for (int i = 0; i < length; i++) rand.nextInt(maxRange)
  ];
  return result;
}

int main() {
  final List<int> arr1 = getRandom(length: 10, maxRange: 10);
  arr1.sort();
  print(arr1);
  try {
    print(binarySearch(arr1, 0, arr1.length - 1, 5));
  } catch (e) {
    print(e);
  }

  return 0;
}
