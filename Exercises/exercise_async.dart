Future<void> countdown(int n) async {
  var result;
  for (var i = 0; i <= n; i++) {
    result = await Future.delayed(Duration(seconds: 1), () => n - i);
    print(result);
  }
  print("Be in zazen!");
}

Future<int> main() async {
  await countdown(5);
  print("Done!");
  return 0;
}
