void main() {
  var y = 5;
  // .parse is used to turn numbers represented as strings into numbers

  String q = '29';
  var q2 = int.parse(q);
  var q3 = double.parse(q);

  print(q.runtimeType); // .runtimeType returns the data type of a variable
  print(q2.runtimeType);
  print(q3.runtimeType);

  var q4 = q2 + q3; // adding variables

  print('the value of q4 is $q4.');

  // Working with operators
  // use double & to represent AND with boolean operations

  print(q4 >= q2 && q4 == q2 + q3);

  print(10 % 2); // returns the remander

  // use double | to represent OR with a boolean operation
  print(q4 >= q2 || q2 < q3);

  // is returns turns true if the condition is met false otherwise

  print(q4 is int);

  print(q4 is! bool); // is! == is not

  y += 5; // the same as y = y + 5;

  y++; // the same as y = y + 1;

  y--; // the same as y = y - 1;

  y *= 3; // the same as y = y * 3;

  print(y);
}
