// Closure:

//   - functions (anonymous or named) that have access to variables inside their enclosing lexical scope
//     even when a function is used outside of its original scope

//  They can be used to manage the state of enclosing scope variables

typedef IntFunc = int Function(int);

// makeAdder returns an anonymous function
// functions are first class objects and can be returned as values

IntFunc makeAdder(int addBy) {
  return (int x) {
    // addBy is a variable that is part of the enclosing lexical scope of the makeAdder function
    return x + addBy;
  };
}

/// The entry point of any program
void main() {
  final IntFunc adder3 = makeAdder(3);
  final IntFunc adder7 = makeAdder(7);

  print('adder3 value: ${adder3(39)}');
  print('adder7 value: ${adder7(39)}');
}
