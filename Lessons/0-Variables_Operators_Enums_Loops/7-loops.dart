// For Loops

//   - finite loop, executes a block of code x number of times

// Example 1:

//  - for loop: factorial

//      - consists of initializer, condition and final expression

int getFactorial(int x) {
  var factorial = 1;
  for (var i = x; i >= 1; i--) {
    factorial *= i;
  }
  return factorial;
}

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

  // Example 2:

  //   - forEach

  //       - a method of interables

  List<String> dopeAnimeCharacters = [
    'Baki Hanma',
    'Ken Kaneki',
    'Yami Sukehiro',
    'Ban',
    'Thorfinn',
  ];

  dopeAnimeCharacters.forEach(
    (hero) => print(hero),
  );

  print('----------------');

// Example 2.1

//   - Callbacks in for loops

//       - The value is captured in callback

  var callBacks = [];
  for (var i = 0; i < 3; i++) {
    callBacks.add(() => print(i));
  }

// Example 2.1 cont.

// for in

//   - you can then iterate over callbacks, calling them indvidually

  for (final lambdaFunction in callBacks) {
    lambdaFunction();
  }

  // Summary of for loop with callbacks

  //   - The variable in the for loop is captured by the callback by index
  //   - The array of callbacks can then be iterated over

  print('----------------');

  const EmployeeRecord emp1 = (
    fname: 'Kweayon',
    lname: 'Clark',
    position: 'Distinguished Software Engineer',
    salary: 264725,
  );

  final List emp2 = [
    'Kweayon',
    'Clark',
    'Distinguished Software Engineer',
    264725,
  ];
  for (var (
        _,
        _,
        :position,
        :salary,
      ) in emp2) {
    print('Position $position salary $salary');
  }
  // // While Loops

  // //   - can be finite or infinte
  // //   - Evaluates some condition, executes code block while the condition remains true
  // //   - while loop evaluates the condition before the block of code is executed
  // //   - Checks condition, executes some code

  // var i = 3;
  // while (i > 0) {
  //   print('You are a beautiful human!');
  //   i--;
  // }

  // // Do While Loops

  // //  - Similar to while loops
  // //  - Do while loops executes the code block
  // //  - then evaluates the condition

  // i = 3;

  // do {
  //   print('Begin, beginning is half the work!');
  //   i--;
  // } while (i > 0);

  // // Infinite While loop

  // //   - Pass the boolean value true to the while loop and it will become infinite

  // // Uncomment the below lines to run the inifinte loop
  // // while (true) {
  // //  print('We are all Human');}
}
