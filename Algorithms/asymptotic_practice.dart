import 'dart:math';

// How to create a log with a base you want
double log2(num x) => log(x.toDouble()) / log(2);

double logLinear(int n) => n * log2(n);

double loglogLinear(int n) => n * log2(log2(n));

void p(x) => print(x);

void main() {
  final int n = 4;
  print('log linear ${logLinear(n)}');
  print('log log linear ${loglogLinear(n)}');
  print(logLinear(n) > loglogLinear(n));
  print(logLinear(n) - loglogLinear(n));
  print(logLinear(n) / loglogLinear(n));
}



// num? f1(num n) => pow(n, 0.999999) * log2(n);

// num? f2(num n) => 10000000 * n;

// num? f3(num n) => pow(1.000001, n);

// num? f4(num n) => pow(n, 2);

  // final funcs = [f1, f2, f3, f4];
  // const x = 6000;

  // p(sqrt(x));

  // const n = 9;

  // const h = 0;

  // p(n / pow(2, h + 1));
  // p(log2(14));

  // p(pow(2, 3));

  // funcs.forEach((func) => print('Func Results: ${func(999999999999)}'));
