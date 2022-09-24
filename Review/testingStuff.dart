num binarySearch(List arr, int low, int high, num x) {
  if (high >= low) {
    int mid = (low + high - 1) ~/ 2;
    if (arr[mid] == x) {
      return arr[mid];
    } else if (x < arr[mid]) {
      return binarySearch(arr, low, mid - 1, x);
    }
    return binarySearch(arr, low, mid + 1, x);
  } else
    return -1;
}
