// For Loops

//   - finite loop
//   - execute code block x number of times

// consists of three parts:

//   - initalizer (instantiated variable)
//   - condition
//   - final expression

// Example 1: for loop

int getFactorial(int x) {
  var factorial = 1;
  for (var i = x; i >= 1; i--) {
    factorial *= i;
  }
  return factorial;
}

void main() {
  final num = 4;

  print(
    'The factorial of $num is ${getFactorial(num)}',
  );
}
