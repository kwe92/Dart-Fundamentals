import 'dart:math';

void main() {
  dynamic obj = 42;

  const first = 0;

  const last = 51;

  switch (obj) {
    case 42:
      print('the answer: $obj');
      continue inBetween;

    inBetween:
    case >= first && < last:
      print('you have made it to the inbetween');

    case (var a, var b):
      print('a = $a, b = $b');
  }

  // Example: Logical-or Pattern

  final color = Colors.values[Random().nextInt(Colors.values.length)];

  final isPrimary = switch (color) {
    Colors.red || Colors.yellow || Colors.blue => true,
    _ => false,
  };

  print('${color.name} is a primary color: $isPrimary');
}

enum Colors {
  red,
  yellow,
  green,
  blue,
  purple;
}

// Pattern Matching: Switch Statements and Expressions

//   - when you use a case clause you are actually matching against a pattern

//   - any kind of pattern can be used in a case clause to match against

//   - you can use the match as a boolean predicate to execute some block of code
//     if the case clause pattern is matched

//   - you can also match and destructure simultaneously creating new local
//     variables in the scope of the matched case clause

// Case patterns are refutable, allowing control flow to either:

//   - match and destructure the object being switched on

//   - continue execution if the object doesn't match

// Logical-or Pattern

//   - logical-or patterns gives multiple cases the ability to share the same body
//     in switch expressions or statements

