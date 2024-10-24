void main() {
  // Eexample: list pattern

  //   - uses a literal to first match against a list

  //   - then extract the elements from the list
  //     if the list is the length of the sub-pattern used
  //     (unless you use the 'rest' element syntax)

  //   - in our example [a, b, c] destructures the three elements from myList

  //   - assigning them to new variables

  var myList = [1, 3, 7];

  var [a, b, c] = myList;

  print(a + b + c);

  switch (myList) {
    // a list with 3 elements whose first element can be 1 or 2, second element can be 3 or 4 and the third element can be any integer
    case [1 || 2, 3 || 4, int c]:
      print(c);
    default:
      print('pattern does not match.');
  }
}

// Destructuring

//   - when an object and a pattern match the pattern can access the objects
//     data and extract it entirely or in parts

//   - when destructuring collections, the appropriate collection literal
//     needs to be used as a type matcher (outer pattern)

// Nested Patterns Whsen Destructuring

//   - any kind of pattern can be nested inside a destructuring pattern
