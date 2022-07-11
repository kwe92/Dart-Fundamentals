// import the 'dart:math' library
// ''dart:math library:
//        - Mathematical constants and functions, plus a random number generator.

import 'dart:math';

void main() {
  num x = Random().nextInt(10);

  // The Random class is a generator of a random number.
  // .nextInt is a method that randomly generates a number from 0 inclusive to n exclusive range.

  var z = Random().nextInt(10);

  var y;

  // if is a keyword in dart that evaluates a boolean expression
  // and executes some code if the boolean expression evaluates to true.
  // else is a keyword in dart and executes if the boolean expression evaluates to false.

  if (x > z) {
    // pow is a mathmatical power function we can use after importing 'dart:math'.
    y = pow(x, 2);
  } else {
    y = pow(x, 3);
  }

  List<num> nums = [x, y, z];

  nums.forEach((e) {
    print(e);
  });

  // Conditional Operation

  Function rand = Random().nextInt;

  var a = rand(10);

  var b = rand(10);

  var c = a > b ? pow(a, 2) : pow(b, 3);

  print('value of a: $a');
  print('value of b: $b');
  print('value of c: $c');
}
