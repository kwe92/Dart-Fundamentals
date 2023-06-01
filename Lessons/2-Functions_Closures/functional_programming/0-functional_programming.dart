// Function Signatures
typedef IntFunc = int Function(int x);

int main() {
  final IntFunc t = (int x) => x * 2;

  const int x = 4;

  const arr1 = [1, 2, 3, 4];

  final List Function(List, IntFunc) mapper = (List arr, IntFunc func) {
    List returnArr = [];
    for (int i = 0; i < arr.length; i++) {
      returnArr.insert(
        i,
        func(arr[i]),
      );
    }
    return returnArr;
  };

  final arr2 = mapper(arr1, t);

  int mod2(int x) => x % 2;

  print(t(x));
  print('Arr2: $arr2');
  print(mod2(x));
  print(t.toString());

  return 0;
}
