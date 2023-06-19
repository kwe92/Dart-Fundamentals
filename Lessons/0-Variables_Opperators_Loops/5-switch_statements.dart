void main() {
  // Say you have two numbers:

  //      x = 5
  //      y = 3

  // You dont know which opperation you want to perform on both numbers
  // So we use a switch statement
  // op in this example is representative of the operation we want to perform

  var x = 5;
  var y = 3;

  var op = 'add';

  // Switch statements

  //      - Evaluate some expression in this case our expression is the variable op
  //      - The value of the expression is tested against all case statements
  //      - if the expression returns true for a case statement then that case statements code block is returned
  //      - if there is no matching case statement for the evaluated expression then our default case is returned

  // Example 1:

  //      - Given some mathmatical operation to perform, execute the given operation on variables x & y respectively

  switch (op) {
    case 'add':
      print('x + y = ${x + y}');
      break;
    case 'subtract':
      print('x - y = ${x = y}');
      break;
    case 'multiply':
      print('x * y = ${x * y}');
      break;
    case 'divide':
      print('x / y = ${x / y}');
      break;
    case 'mod':
      print('x % y = ${x % y}');
      break;
    default:
      print(
          'Incorrect operation, please use one of the following: add, subtract, multiply, divide, mod');
      break;
  }

  // Example 2:

  //      - Given and integer bwtween 1-7 what is the corresponding day of the week

  int numericDayOfWeek = DateTime.wednesday;

  switch (numericDayOfWeek) {
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break;
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
    case 7:
      print('Sunday');
      break;
    default:
      print('Integer to be evaluated must be bewteen 1-7.');
  }
}
