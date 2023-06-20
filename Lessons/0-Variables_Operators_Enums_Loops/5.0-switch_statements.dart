// Switch statements

//   - evaluates an expression against a series of cases
//   - each case clause is a pattern that a value can match against
//   - if the value matches the case's pattern the case body executes
//   - if no case clause is matched then the default case is returned
//   - non-empty case clauses do not require a break statement as they jump to the end of the switch statement

// Example 1:

//  - given some mathmatical operation to perform
//  - execute the given operation on variables x & y respectively

void main() {
  int x = 5;
  int y = 3;

  List<String> operations = [
    'add',
    'subtract',
    'multiply',
    'divide',
    'mod',
  ];

  switch (operations[2]) {
    case 'add':
      print('$x + $y = ${x + y}');
    case 'subtract':
      print('$x - $y = ${x - y}');

    case 'multiply':
      print('$x * $y = ${x * y}');

    case 'divide':
      print('$x / $y = ${x / y}');

    case 'mod':
      print('$x % $y = ${x % y}');

    default:
      print('Incorrect operation, please use one of the following: add, subtract, multiply, divide, mod');
  }

  // Example 2:

  //      - Given an integer between 1-7 what is the corresponding day of the week

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
