// Globally Mutable State
//    - A variable declared globally that is mutable
var globalVariableCounter = 0;

void main() {
  void increment() {
    globalVariableCounter++;
    print('I am a function that modifies the value of globalVariableCounter' +
        '\n' +
        'Which makes me a NON-PURE Function!' +
        '\n' +
        'globalVariableCounter value: $globalVariableCounter');
  }

  increment();
  increment();
  increment();
  increment();
}
