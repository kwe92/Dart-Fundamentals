typedef IntFunc = int Function(int);
void main() {
  // lambda function with body
  () {
    print('basic anonymous function.');
  }();

  // lambda function as an arrow function
  () => print('basic lambda arrow function.');

  int multiply(int x, IntFunc timesFunc) => timesFunc(x);

  print('High Order Function - multiply(3, (n) => n * 4): ${multiply(3, (n) => n * 4)}');
}


// Anonymous Functions:

//   - originate from lambda calculus theory

//   - unnamed function

//   - usable where functions are usable

//   - Anonymous Function Names:

//      - closure:

//          - functions (anonymous or named) that remember and retain access to variables 
//            from their surrounding environment (lexical scope) even after the outer function has finished executing.

//       - callback:

//           - a first class function that a client (code calling a module) passes to a module
//             as an argument to be called within the modules implementation


//           - can also be aeference to functions in memory