class Fraction {
  final double numerator;

  final double denominator;

  final double value;

  const Fraction({required this.numerator, required this.denominator})
      : assert(denominator != 0, 'Zero division error, denominator must be greater than zero.'),
        value = numerator / denominator;

  // Computed variable
  // double get value => numerator / denominator;

  @override
  String toString() => "Fraction($value)";
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

// Assert Statements

//   - assertions are used to ensure some condition of your API is being met
//     during the developing stages

//   - assertions are only typically only used in development and implicitly turned off
//     in production code

//   - in production code, assertions are ignored, and the arguments to assert aren't evaluated

//   - to use assertion in dart code add the --enable-asserts command-line flag when using dart run:

//       - dart run --enable-asserts

// Assert Statement Passing and Failing

//    - returning true means the assertion passed and false means the condition was not satisfied
//      and program exection should be disrupted (AssertionError thrown)

// Assert Statement Syntax

//   - asser(<condition>, <optionalMessage>)

//   - the condition can be any expression that evaluates to a truth value (boolean value)

