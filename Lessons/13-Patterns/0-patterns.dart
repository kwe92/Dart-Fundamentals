void main() {
  const number = 42;

  const a = 4;

  const b = 2;

  final obj = [a, b];

  switch (number) {
    // Constant pattern matches if 1 == number
    case 1:
      print('one');

    default:
      print("number has no matching :(");
  }

  switch (obj) {
    // Constant sub-pattern matching
    // is obj a list of length 2, if so do the two elements match the constant values of the sub-pattern
    case [a, b]:
      print('$a + $b = ${a + b}');

    default:
      print("default called");
  }
}

// Patterns

//  - syntactic category, like statements and expressions

//   - represents the shape of a set of values that can be matched against actual values

//  - What patterns do

//      - match values, destructure values, or both

// Pattern matching

//   - match value against a pattern checking if the value matches certain properties:

//       - does the value have a certain shape

//       - is the value a particular constant

//       - is the value equal to something else

//       - does the value have a specific type

// Types of Patterns

//   - there are many different patterns you can match against

// Pattern Destructuring

//   - a convient declarative syntax to break a value into its constituent parts
//     allowing you to bind (assign references to) some or all of the parts

// More Pattern Use Cases

//   - swapping variables

//   - destructuring key-value pairs

//   - destructuring complex objects (object pattern)

//   - returning mutliple values from a function and destructuring the returned
//     record into new or existing local variables

//   - pattern matching in control flow statements and branches

//   - pattern matching in collection-for literals

//   - when writting code in an Algebraic Data Type manner 

