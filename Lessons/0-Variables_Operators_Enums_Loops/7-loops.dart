// For Loops

//   - finite loop
//   - execute code block x number of times

// consists of three parts:

//   - initalizer (instantiated variable)
//   - condition
//   - final expression

// Example 1: for loop

import '5.5-switch_statements_guard_clause.dart';

int getFactorial(int x) {
  var factorial = 1;
  for (var i = x; i >= 1; i--) {
    factorial *= i;
  }
  return factorial;
}

// Records

//   - new feature of Dart 3 jan 2023
//   - see record lessons
//   - no need to skip to Record lessons though

typedef EmployeeRecord = ({
  String fname,
  String lname,
  String position,
  double salary,
});

void main() {
  final num = 4;

  print(
    'The factorial of $num is ${getFactorial(num)}',
  );

  // Example 2: forEach

  //   - method of most collections in Dart 3
  //   - argument is a callback, executes for every element
  //   - returns void, not a new lazy iterable

  List<String> dopeAnimeCharacters = [
    'Baki Hanma',
    'Ken Kaneki',
    'Yami Sukehiro',
    'Ban',
    'Thorfinn',
  ];

  final Map<String, String> hashMap = {
    "1": "keep",
    "2": "it",
    "3": "up",
  };

  hashMap.forEach(
    (String key, String value) => print(
      value.toUpperCase(),
    ),
  );

  dopeAnimeCharacters.forEach(
    (String hero) => print(hero),
  );

  print('----------------');

// Example 2.1: Callbacks in for loops

//       - The value is captured in callback

  var lambdaFunctions = [];
  for (var i = 0; i < 3; i++) {
    lambdaFunctions.add(() => print(i));
  }

// Example 2.2: for-in loop

//   - iterate over callbacks, calling them indvidually

  for (final lambda in lambdaFunctions) {
    lambda();
  }

  print('----------------');

  // While loops

  //  - can be finite or infinte
  //  - Evaluates some condition
  //  - executes code block while condition remains true
  //  - evaluates condition before block is executed
  //  - Checks condition, executes some code

  var i = 3;
  while (i > 0) {
    print('You are a beautiful human!');
    i--;
  }

  // do-while loops

  //  - executes the code block
  //  - then evaluates the condition

  i = 3;

  do {
    print('Begin, beginning is half the work!');
    i--;
  } while (i > 0);

  // infinite while loop

  //   - passing boolean value true to a while loop results in infinite loop

  // Uncomment the below lines to run the inifinte loop

  // while (true) {
  //  print('We are all Human');}
}
