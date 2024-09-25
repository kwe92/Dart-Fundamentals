int factorial(int x) {
  var result = 1;

  for (var i = x; i >= 1; i--) {
    result *= i;
  }
  return result;
}

int factorialRecursive(int x) {
  if (x <= 1) {
    return 1;
  }

  return x * factorialRecursive(x - 1);
}

void main() {
  final num = 4;

  print('The factorial of $num is ${factorial(num)}');

  print('The factorial of $num is ${factorialRecursive(0)}');
}

// Control Flow

//   - as the name implies we want to control the flow of our
//     program given certain conditions or lack thereof

//   - loops and supporting statements are one tool to
//     control the flow of a program along with branches and exception handling

// Standard for loops

//   - control the flow of a program by iterating through a finite loop
//      executing a block of code n number of times

//   - for loops have 3 required components

//   - most recursive functions can be handled with some form of a loop

// for loop Components:

//   - initalizer variables / loop variables (at least one is required but may contain more)

//   - condition (the condition that will terminate the loop if false)

//   - final expression / iteration expression (updates the initalizer variables, typically with an augment assignment operator such as ++ or -- to increment and decrement respectively)
