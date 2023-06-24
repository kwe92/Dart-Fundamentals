// While loops

//  - can be finite or infinte
//  - Evaluates some condition
//  - executes code block while condition remains true
//  - evaluates condition before block is executed
//  - Checks condition, executes some code

void main() {
  var i = 3;
  while (i > 0) {
    print('You are a beautiful human!');
    i--;
  }

  // do-while loops

  //   - executes the code block
  //   - then evaluates the condition

  i = 3;

  do {
    print('Begin, beginning is half the work!');
    i--;
  } while (i > 0);

  // infinite while loop

  //   - passing true to while loop results in infinite loop

  // while (true) {
  //   print('We are all Human');
  // }
}
