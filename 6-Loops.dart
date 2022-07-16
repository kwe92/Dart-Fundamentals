void main() {
  var num = 5;
  var factorial = 1;

  List<String> dopeAnimeCharacters = [
    'Baki Hanma',
    'Ken Kaneki',
    'Yami Sukehiro',
    'Ban',
    'Thorfinn',
  ];

  // A for loop is a finite loop that executes a block of code a specified number of times
  // This for loop has 3 parts
  // initializer, condition and final expression
  // The initializer is var i = num or 5
  // The condition of execution is as long as i is greater than or equal to 1 repeat the loop
  // The final expression i-- reduces i by 1 for every iteration that the block is ran until i reaches 0

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
}
