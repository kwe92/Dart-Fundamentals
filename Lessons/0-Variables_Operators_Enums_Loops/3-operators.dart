void main() {
  int y = 5;

  int num1 = 42;
  int num2 = 12;

  print(num1.runtimeType);
  print(num2.runtimeType);

  var sum_num1_num2 = num1 + num2; // adding variables

  print('the sum of $num1 + $num2 is $sum_num1_num2.');

  // Working with operators

  // Logical AND

  //   - && represents AND

  print(sum_num1_num2 >= num1 && sum_num1_num2 == num1 + num2);

// Modulo
//  - returns the remander

  print(10 % 2);

  // Logical OR

  //   - || represents OR

  print(sum_num1_num2 >= num1 || num1 < num2);

  // is keyword

  //   - returns turns true if the condition is met false otherwise

  print(sum_num1_num2 is! bool); // is! == is not

// Augmented operators

  y += 5; // the same as y = y + 5;

  y++; // the same as y = y + 1;

  y--; // the same as y = y - 1;

  y *= 3; // the same as y = y * 3;

  print(y);
}
