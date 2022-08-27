// Globally Mutable State
//    - A variable declared globally that is mutable
//    - Global mutal states are typically a really bad idea and should rarely be used

var global_Mutable_Variable_Counter = 0;

const global_Immutable_Variable = 0;

/// The entry point to any program
void main() {
  // Non Pure Functions
  //    - A function that modifies a variable outside of its scope
  //      this is also called a side effect
  void increment() {
    global_Mutable_Variable_Counter++;
    print('I am a function that modifies the value of globalVariableCounter' +
        '\n' +
        'Which makes me a NON-PURE Function!' +
        '\n' +
        'globalVariableCounter value: $global_Mutable_Variable_Counter');
  }

  // Pure Function

  // This function uses a global variable but does not modify it
  // A pure function produces the same result when called with the same argument
  num increment2([num i = 1]) {
    num result = 0;
    result += global_Immutable_Variable + i;
    return result;
  }

  for (var i = 0; i < 3; i++) increment();
  print(
      'Result from calling increment2 a pure function: ${increment2()} | global_Immutable_Variable value: $global_Immutable_Variable');
  for (var i = 0; i < 2; i++)
    print(
        'result of increment2(3): ${increment2(3)} | global_Immutable_Variable value: $global_Immutable_Variable');
}
