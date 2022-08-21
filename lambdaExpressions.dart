import 'dart:math';

void main() {
  var powFunc = (int a, int b) => pow(a, b);

  print(powFunc(5, 4));

  var f = (int x) => x;

  var h = (int y) => y;

  print(h(f(4)) * 5);
}
