void main() {
  // Say you have two numbers
  // x = 5
  // y = 3
  // You dont know which opperation you want to perform on both numbers
  // So we use a switch statement

  var x = 5;
  var y = 3;
  // op in this example is representative of the operation we want to perform
  var op = 'add';

  // Switch statements

  //      - Evaluate some expression in this case our expression is the variable op
  //      - The value of the expression is tested against all case statements
  //      - if the expression returns true for a case statement then that case statements code block is returned
  //      - if there is no matching case statement for the evaluated expression then our default case is returned

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
}
