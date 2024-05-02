void main() {
  double counter = 0;

  List<double> vals = List.generate(100, (_) => double.parse((counter += 0.01).toStringAsPrecision(2)));

  print(vals);

  for (var val in vals) {
    final double initialTransaction = val;

    final double remainder = getRemander(initialTransaction);

    print("initial transaction + remainder: ${initialTransaction + remainder}");
  }

  // final double initialTransaction = 5850;

  // final double remainder = getRemander(initialTransaction);

  // print("initial transaction + remainder: ${initialTransaction + remainder}");
}

double getRemander(double initialTransaction) {
  double remainder = double.parse(
    (1 - (initialTransaction - initialTransaction.floor())).toStringAsPrecision(2),
  );

  if (remainder == 0) {
    return 1;
  }

  return remainder;
}

// TODO: implement to reange for double
// List<double> getRangeDouble(double start, double end) {
//   double counter = start;

//   List<double> vals = List.generate(100, (_) => double.parse((counter += 0.01).toStringAsPrecision(2)));

//   throw UnimplementedError();
// }
