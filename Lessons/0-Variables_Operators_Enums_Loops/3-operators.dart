void main() {
  int y = 5;

  int num1 = 42;
  int num2 = 12;

  var sum_num1_num2 = num1 + num2; // adding values a variable references

  print('the sum of $num1 + $num2 is $sum_num1_num2.');

  // Working with operators

  // Logical AND

  //   - && represents Logical AND

  print(sum_num1_num2 >= num1 && sum_num1_num2 == num1 + num2);

// Modulo

//  - returns the remander

  print(10 % 2);

  // Logical OR

  //   - || represents Logical OR

  print(sum_num1_num2 >= num1 || num1 < num2);

  // is keyword

  //   - returns turns true if the condition is met false otherwise

  //   - typically used to say a variable references a value of a certain type

  print(sum_num1_num2 is! bool); // is! == is not

// Some Augmented Assignment Operators

  y += 5; // the same as y = y + 5;

  y++; // the same as y = y + 1;

  y--; // the same as y = y - 1;

  y *= 3; // the same as y = y * 3;

  print(y);
}
