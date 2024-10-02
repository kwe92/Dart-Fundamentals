// Global Mutable State

//    - mutable global variable

//    - typically bad idea, should rarely be used

var globalMutableVariableCounter = 0;

const globalImmutableVariable = 0;

/// The entry point to any program
void main() {
  void increment() => globalMutableVariableCounter++;

  int Function() increment2(int n) => () {
        return n++ + 1;
      };

  for (var i = 0; i < 3; i++) {
    increment();
  }

  print('globalMutableVariableCounter: $globalMutableVariableCounter');

  final counter = increment2(globalMutableVariableCounter);

  for (var i = 0; i < 3; i++) {
    print(counter.call());
  }

  print('globalMutableVariableCounter: $globalMutableVariableCounter');
}

  // Pure Function (Law of Demeter)

  //   - a function without side effects

  //   - produces the same result when called with the same argument

  //   - does not modify varables outside of its scope

  //   - typically returns something


  // Impure Functions

  //   - A function producing side effect

  //   - modifies a variable outside of its scope

  //   - may not always return the same output given the same input

  //   - typically returns void