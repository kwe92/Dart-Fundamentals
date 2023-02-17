class Fraction {
  const Fraction({required this.numerator, required this.denominator})
      : assert(denominator != 0,
            'Zero division error, denominator must be greater than zero.');
  final double numerator;
  final double denominator;

  // Computed variable
  double get value => numerator / denominator;

  @override
  String toString() => "Value: $value";
}

void signIn(String email, String password) {
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

void main() {
  print(Fraction(numerator: 5, denominator: 8));
  print(Fraction(numerator: 0, denominator: 3));
  print(Fraction(numerator: 8, denominator: 0));
  signIn('', '');
}
