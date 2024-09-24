enum ArithneticOperations {
  add,
  subtract,
  multiply,
  divide,
  mod;
}

void main() {
  int x = 5;
  int y = 3;

  final operation = ArithneticOperations.multiply;

// Example 1:

//   - given some arithmetic operation to perform

//   - execute the given operation on the values referenced by the variables x and y respectively

  try {
    switch (operation) {
      case ArithneticOperations.add:
        print('$x + $y = ${x + y}');

      case ArithneticOperations.subtract:
        print('$x - $y = ${x - y}');

      case ArithneticOperations.multiply:
        print('$x * $y = ${x * y}');

      case ArithneticOperations.divide:
        print('$x / $y = ${x / y}');

      case ArithneticOperations.mod:
        print('$x % $y = ${x % y}');

      default:
        throw Exception('Incorrect operation, please use one of the following: add, subtract, multiply, divide, or mod');
    }
  } catch (err, _) {
    print(err.toString());
  }

  // Example 2:

  //   - Given an integer between 1-7 what is the corresponding day of the week

  int numericDayOfWeek = DateTime.wednesday;

  try {
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
        throw Exception('Integer to be evaluated must be bewteen 1-7.');
    }
  } catch (err, _) {
    print(err.toString());
  }
}

// Switch statements

//   - evaluates a value expression against a series of cases

//   - each case clause is a pattern that a value can match against

//   - any kind of pattern can be used for a case, granting enormous flexibility

//   - if the value matches the cases pattern the case body executes

//   - if no case clause is matched then the default case is returned

//   - non-empty case clauses do not require a break statement as they jump to the end of the switch statement

//   - empty case clauses fall through to the next case, allowing case statements to share a body

//   - for more complex control flow you can use case labels along with the continue keyword
