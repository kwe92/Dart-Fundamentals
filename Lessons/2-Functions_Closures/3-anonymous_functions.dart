// Anonymous Functions:

//   - originate from lambda calculus theory
//   - unnamed function
//   - usable where functions are usable

//   - Anonymous Function Names:

//       - closure (functions that retain their lexical scope)

//       - callback:

//           - references to functions in memory not defined in current module
//           - can be access in other parts of a program)

typedef IntFunc = int Function(int);
void main() {
  // lambda function with body
  () {
    print('basic anonymous function.');
  };

  // lambda function as an arrow function
  () => print('basic lambda arrow function.');

  int multiply(int x, IntFunc timesFunc) => timesFunc(x);

  print('High Order Function - multiply(3, (p0) => p0 * 4): ${multiply(3, (p0) => p0 * 4)}');
}
