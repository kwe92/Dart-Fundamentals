void main() {
  var closureFunctionCallbacks = List.filled(5, () {}, growable: false);

  for (var i = 0; i < closureFunctionCallbacks.length; i++) {
    closureFunctionCallbacks[i] = () {
      print(i);
    };
  }

  for (final closure in closureFunctionCallbacks) {
    closure.call();
  }
}

// Closures in Dart for loops

//   - The loop variable value can be captured in closures
//     to be called back later in the code

  // for-in loop

  //   - loop over the elements within an Iterable Object
  //     without returning the iteration counter

  //   - a for-in loop implicitly stops when there are no more elements to iterate
  //     over within an Iterable Object