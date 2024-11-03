import 'dart:math';

import '../lessons/7-extensionsMixins/extensions/2.2-named_extensions_with_generics.dart';

void main() {
  List<double> roundedAmounts = randDoubleArr(9);

  print("roundedAmounts: ${roundedAmounts.sum().toStringAsFixed(2)}");
}

List<double> randDoubleArr(int length) => [
      for (int i = 0; i < length; i++)
        () {
          double changeToRoundUp = Random().nextDouble();

          if (changeToRoundUp == 0) {
            changeToRoundUp += 0.01;
          }

          return double.parse(changeToRoundUp.toStringAsPrecision(2));
        }(),
    ];
