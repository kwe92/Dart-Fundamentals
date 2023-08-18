// Number Theory: Congruence
// - a is congruent to b (mod n) iff n | (a - b) or rem(a,n) == rem(b,n) where rem is a function that returns the remainder of a / n

// Remainder Function (Euclidean Modulo)
int rem(int a, int b) => a - (b * (a ~/ b));

bool isCongruent1(int a, int b, int n) => ((a - b) / n) - ((a - b) ~/ n) == 0 ? true : false;

bool isCongruent2(int a, int b, int n) => rem(a, n) == rem(b, n) ? true : false;

int main() {
  int a = 29;

  int b = 15;

  int n = 7;

  print(isCongruent1(a, b, n));
  print(isCongruent2(a, b, n));
  print('Remainder: ${rem(15, 6)}');

  return 0;
}
