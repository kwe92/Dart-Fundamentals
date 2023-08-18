// num binarySearch(List arr, int low, int high, num x) {
//   if (high >= low) {
//     int mid = (low + high - 1) ~/ 2;
//     if (arr[mid] == x) {
//       return arr[mid];
//     } else if (x < arr[mid]) {
//       return binarySearch(arr, low, mid - 1, x);
//     }
//     return binarySearch(arr, low, mid + 1, x);
//   } else
//     return -1;
// }

int main() {
  // Declaring and Initalizing a variable as an Anonymous function
  final Function someNumPlus5 = (int n) {
    return 5 + n;
  };
  print(someNumPlus5(32));
  // Calling an anonymous function without declaring a variable name
  // AKA unnamed function
  print(
    (int n) {
      return 5 + n;
    }(40),
  );
  return 0;
}
