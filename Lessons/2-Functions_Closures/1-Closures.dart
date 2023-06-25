// Closure:

//   - anonymous function
//   - has access to variables inside their lexical scope
//   - even when a function is used outside of its original scope

typedef IntFunc = int Function(int);

// makeAdder returns an anonymous function
// functions are objects and can be returned as values

IntFunc makeAdder(int addBy) => (int x) => x + addBy;

/// The entry point of any program
void main() {
  final IntFunc adder3 = makeAdder(3);
  final IntFunc adder7 = makeAdder(7);

  print('adder3 value: ${adder3(39)}');
  print('adder7 value: ${adder7(39)}');
}
