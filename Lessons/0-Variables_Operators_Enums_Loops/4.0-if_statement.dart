import 'dart:math';

// dart:math library:

//  - Mathematical constants and functions
//  - random number generator

void main() {
  // proposition

  //   - a statement || assertion that is true or false
  //   - a function returning true or false given some condition

  bool proposition(num x, num y) => x > y ? true : false;

  // Random Class

  //   - generator of a random number

  final num x = Random().nextInt(10);
  final y = Random().nextInt(10);

  final z;

  // if-else statements

  //   - evaluates a proposition
  //   - if the proposition is true the if block is executed
  //   - if the proposition is false for all if statements the else block is executed

  if (proposition(x, y)) {
    z = pow(x, 2);
  } else {
    z = pow(x, 3);
  }

  print('value of z: $z');

  // Conditional Operators

  //   - A concise way to evalute expressions

  // Ternary operator

  //   - Short hand for writing if-else statements
  //   - syntax: condition ? exp1 : exp2;

  // Binary operator

  //   - If the first expression is null return the second expression
  //   - syntax: exp1 ?? exp2

  Function rand = Random().nextInt;

  var a = rand(10);

  var b = rand(10);

  // if a is greater than b assign c a squared else assign c b cubed.

  int c = a > b ? pow(a, 2).toInt() : pow(b, 3).toInt();

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
