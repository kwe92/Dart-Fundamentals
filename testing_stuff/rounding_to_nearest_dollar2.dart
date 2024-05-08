void main() {
  final int transaction = 12400;

  print(remainder(transaction));
}

int remainder(int transaction) {
  final usdVal = transaction / 100;
  print(usdVal);

  print("${usdVal.toString().split(".")}");

  final change = int.parse(usdVal.toString().split(".")[1]);

  if (change == 0) {
    return 100;
  }

  return change;
}
