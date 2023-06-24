// Globally Mutable State

//    - mutable globally declared variable
//    - typically bad idea, should rarely be used

var global_Mutable_Variable_Counter = 0;

const global_Immutable_Variable = 0;

/// The entry point to any program
void main() {
  // Non-pure Functions

  //    - A function producing side effect
  //    - modifies a variable outside of its scope
  //    - may not always return the same output given the same input

  void increment() {
    global_Mutable_Variable_Counter++;
    print('I am a function that modifies the value of globalVariableCounter' +
        '\n' +
        'Which makes me a NON-PURE Function!' +
        '\n' +
        'globalVariableCounter value: $global_Mutable_Variable_Counter');
  }

  // Pure Function (Law of Demeter)

  //   - produce same result when called with the same argument
  //   - does not modify varables outside of its scope

  num increment2([num i = 1]) {
    num result = 0;
    result += global_Immutable_Variable + i;
    return result;
  }

  for (var i = 0; i < 3; i++) increment();
  print('Result from calling increment2 a pure function: ${increment2()} | global_Immutable_Variable value: $global_Immutable_Variable');
  for (var i = 0; i < 2; i++)
    print('result of increment2(3): ${increment2(3)} | global_Immutable_Variable value: $global_Immutable_Variable');
}
