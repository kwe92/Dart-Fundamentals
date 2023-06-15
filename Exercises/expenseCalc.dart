// ignore_for_file: unused_local_variable, unused_import

import 'dart:io';

class ExpenseCalc {
  ExpenseCalc({required this.netPay, required this.expenses, this.savPct = 0.20});
  final double netPay;
  final List<double> expenses;
  final double savPct;

  double get exp => expenses.reduce((ele, val) => ele + val);
  double get toSave => _round(netPay * savPct);
  double get finalNet => _round(netPay - (exp + toSave), 2);

  @override
  String toString() => "Expense total: $exp\n" "Total Saved: $toSave\n" "Final Net: $finalNet\n";
  double _round(num n, [int p = 0]) => double.parse(n.toStringAsFixed(p));
}

void main() {
  final ExpenseCalc calc = ExpenseCalc(netPay: 1682, expenses: [70, 70], savPct: 0.20);
  print(calc);

  //stdout.write("Enter Expenses: ");
  //var userInput = stdin.readByteSync();
  //print(userInput);
}
