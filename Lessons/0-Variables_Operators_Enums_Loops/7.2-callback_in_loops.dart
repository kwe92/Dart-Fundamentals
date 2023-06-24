// Callbacks in for loops

//   - The value is captured in callback
void main() {
  var lambdaFunctions = [];
  for (var i = 0; i < 3; i++) {
    lambdaFunctions.add(() => print(i));
  }

  // for-in loop

  //   - iterate over callbacks, invoking them indvidually

  for (final lambda in lambdaFunctions) {
    lambda();
  }
}
