// Function Signatures

typedef IntFunc = int Function(int x);

typedef HighOrderFunction = Iterable Function(List, IntFunc);

int main() {
  // assign callback to a variable
  final IntFunc times2 = (int x) => x * 2;

  const int x = 4;

  const List<int> arr1 = [1, 2, 3, 4];

// takes a function as an arguement
  final HighOrderFunction mapper = (
    List arr,
    IntFunc func,
  ) =>
      arr.map((ele) => func(ele));

  final arr2 = mapper(arr1, times2);

  int mod2(int x) => x % 2;

  print(times2(x));
  print('Arr2: $arr2');
  print(mod2(x));
  print(times2.toString());

  return 0;
}
