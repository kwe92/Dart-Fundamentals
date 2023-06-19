void main() {
  var num = 4;
  var factorial = 1;

  List<String> dopeAnimeCharacters = [
    'Baki Hanma',
    'Ken Kaneki',
    'Yami Sukehiro',
    'Ban',
    'Thorfinn',
  ];

  // For Loops

  // A for loop is a finite loop that executes a block of code a specified number of times
  // Variables can be defined in the initialization
  // This for loop has 3 parts
  // initializer, condition and final expression
  // The initializer is var i = num or 5
  // The condition of execution is as long as i is greater than or equal to 1 repeat the loop
  // The final expression i-- reduces i by 1 for every iteration that the block is ran until i reaches 0
  // for (counter, condition, counter++ || counter--)
  // Example 1:

  //      - For loops to generate a factorial

  for (var i = num; i >= 1; i--) {
    factorial *= i;
  }

  // Example 2:

  //      - Print out dope anime character names

  print('The factorial of $num is $factorial');

  for (var i in dopeAnimeCharacters) {
    print(i);
  }

  print('----------------');

  for (var i in dopeAnimeCharacters) {
    if (i.length > 8) print(i);
  }

  // While Loops

  //      - A while loop can be finite or infinte
  //      - Evaluates some condition and executes the code block as long as that condition remaines true
  //      - The while loop evaluates the condition before the block of code is executed
  //      - Checks condition the executes some code

  var i = 8;
  while (i > 0) {
    print('You are a beautiful human!');
    i--;
  }

  // Do While Loops

  //      - Similar to while loops with a slight difference
  //      - While loops evaluate the condition and if true executes the code block
  //      - Do while loops executes the code block and then evaluates the condition

  i = 8;

  do {
    print('Begin, beginning is half the work!');
    i--;
  } while (i > 0);

  // Infinite While loop

  //      - Pass the boolean value true to the while loop and it will become infinite

  // Uncomment the below lines to run the inifinte loop
  // while (true) {
  //  print('We are all Human');}
}
