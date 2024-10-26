typedef IntFunc = int Function(int);

// Higher-order function that returns a closure (enclosure)
IntFunc makeAdder(int addBy) => (int x) {
      // addBy is a variable that is part of the enclosing lexical scope of the makeAdder function
      return x + addBy;
    };

/// The entry point of any program
void main() {
  final IntFunc adder3 = makeAdder(3);

  final IntFunc adder7 = makeAdder(7);

  print('adder3 value: ${adder3.call(42)}');

  print('adder7 value: ${adder7.call(42)}');
}

// Higher-Order Function

//   - a function that can take other functions as arguments
//     or return a function as a result

// Functions Are First Class Objects

//   - functions are treated like any other data type

//   - They can be assigned to variables

//   - They can be passed as arguments to other functions

//   - They can be returned from functions

// Closure:

//   - functions (anonymous or named) that remember and retain access to variables 
//     from their surrounding environment (lexical scope) even after the outer function has finished executing.

//   - they can be used to capture enclosing scope variables and manage their state
//     preserving the state between function calls