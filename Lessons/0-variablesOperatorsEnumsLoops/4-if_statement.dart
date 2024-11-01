import 'dart:math';

void main() {
  /// a propositional function (predicate) predicated on the values of x and y.
  bool propositionalFunction(num x, num y) => x > y ? true : false;

  final x = Random().nextInt(10);

  final y = Random().nextInt(10);

  final z;

  if (propositionalFunction(x, y)) {
    z = pow(x, 2);
  } else {
    z = pow(x, 3);
  }

  print('value of z: $z');

  var rand = Random().nextInt;

  int? a = rand(10);

  var b = rand(10);

  // if a is greater than b assign c = a squared else assign c = b cubed.

  var c = a > b ? pow(a, 2).toInt() : pow(b, 3).toInt();

  print('value of a: $a');
  print('value of b: $b');
  print('value of c: $c');

  a = null;

  b = rand(100);

  c = a ?? b;

  print('value of a: $a');
  print('value of b: $b');
  print('value of c: $c');
}

  // Proposition

  //   - a statement or assertion that is true or false, typically a sentance

  // Propositional Function (predicate / predicate function)

  //   - a function predicated on the values of a propistional statement
  //     the arguments passed to a propistional functions parameters

  //   - a propsition with variables

  // if-else statements

  //   - control flow statements that evaluate a propositional function and run a branch of code

  //   - if the propositional function is true the if block branch of code is executed

  //   - if the propositional function is false for all if statements the else block branch of code is executed

  // Conditional Operators

  //   - A concise way to evalute boolean expressions

  // Ternary operator

  //   - Short hand for writing if-else statements

  //   - syntax: condition ? exp1 if true : exp2 if false;

  // Binary operator

  //   - If the first expression is null return the second expression

  //   - syntax: exp1 ?? exp2

  //   - symantics: if expression 1 is null, then return expression 2

// dart:math library:

//  - Mathematical constants and functions

//  - random number generator

// Random Class

  //   - generator of a pseudo random number