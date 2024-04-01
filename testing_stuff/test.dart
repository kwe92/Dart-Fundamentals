import 'dart:math';

final rng = Random();

int randRangeInt(int min, int max) => rng.nextInt(max - min) + min;

// from Pragmatic Programmer Illustration figure 3.4
typedef AddProduct = ({
  int id,
  String name,
  int orderCode,
});

typedef Foo = int;

class FooBar {}

void main() {
  // Identifiers

  // int x;

  // int Function(int) doubleNum = (x) => x * 2;

  // Type fooBarType = FooBar;

  // FooBar fooBar = FooBar();

  // var genericIdentityFunction = <T>(T identifier) => identifier;

  // print(genericIdentityFunction<int>(2));

  for (int i = 0; i < 100; i++) {
    print(randRangeInt(5, 11));
  }

  print(roundToNearest(4, 12.232332323232));
}

double roundToNearest(int n, double num) => double.parse(num.toStringAsPrecision(n));
