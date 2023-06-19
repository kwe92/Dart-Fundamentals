// Switch statements

//   - evaluate some expression
//   - test evaluated expression against all case statements
//   - execute the case statement that matches the expression
//   - if no case clause is matched then the default case is returned

// Example 1:
//  - given some mathmatical operation to perform
//  - execute the given operation on variables x & y respectively

void main() {
  int x = 5;
  int y = 3;

  String op = 'add';

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
      print('Incorrect operation, please use one of the following: add, subtract, multiply, divide, mod');
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
