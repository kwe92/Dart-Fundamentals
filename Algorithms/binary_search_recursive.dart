// Binary Search
//  - A searching algorithm used on sorted arrays
//  - divide and conquer algorithm
//  - A searching algorithm used in a sorted array
//  - Searches in Big-O(Log n) time complexity
//  - Repeatedly divides the search interval in half

import 'dart:math';

List<int> getRandom({required int length, int maxRange = 5}) {
  final Random rand = Random();
  final List<int> result = [
    for (int i = 0; i < length; i++) rand.nextInt(maxRange)
  ];
  return result;
}

//int binarySearch({required List<int> arr, required num x, int l = 0, required int r}) {}
num binarySearch(List arr, int l, int r, num x) {
  if (r >= l) {
    int mid = l + ((r - l) / 2).floor();
    if (arr[mid] == x) {
      return mid;
    }
    if (arr[mid] > x) {
      return binarySearch(arr, l, mid - 1, x);
    } else {
      return binarySearch(arr, mid + 1, r, x);
    }
  }
  return -1;
}

int main() {
  final List<int> arr1 = getRandom(length: 500, maxRange: 230);
  arr1.sort();
  print(arr1);
  try {
    print(binarySearch(arr1, 0, arr1.length - 1, 5));
  } catch (e) {
    print(e);
  }

  return 0;
}
