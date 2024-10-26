void main() {
  const List<String> emails = ['abc@abc.com', 'me@example.com', 'john@gmail.com', 'katy@yahoo.com'];

  const knownDomains = ['gmail.com', 'yahoo.com'];

  // Declarative Programming Example

  final unknownDomains = emails
      .map(
        (emailAddress) => emailAddress.split('@').last, // anonymous closure / callback
      ) // higher order function (method): map
      .where(
        (domain) => !knownDomains.contains(domain), // anonymous closure / callback
      ) //higher order function (method): where
      .toList(); // return new array instead of modifying existing array: immutability

  print('unknownDomains using Declarative function composition: ${unknownDomains}');

  // Imperative Programming Example

  final unknownDomains2 = <String>[];

  for (var emailAddress in emails) // explicit control flow
  {
    final domain = emailAddress.split('@').last;
    if (!knownDomains.contains(domain)) // explicit control flow
    {
      unknownDomains2.add(domain); // modify state outside of its scope / return value
    }
  }

  print('unknownDomains2 using Imperative programming: $unknownDomains2');
}

// Imperative Programming

//   - an explicit sequence of instructions that manipulates data and
//     modifies program mutable state

//   - focuses on HOW to do something step by step often relying on some mutable state

// Imperative Programming Key Characteristics

//   - State (Mutability): some mutable state that can be modified at runtime

//   - Control Flow: explicitly controls the order of program execution with control flow statements
//                   like loops and conditional branching

//   - Side Effects: Imperative programming typically has side effects modifying some state outside of its return value

// Imperative Programming Summary

//   - focuses on the process of a computation, emphasizing expicit steps (looping and branching) and state modification (side effects)

// Declarative Programming

//   - focuses on WHAT to achieve through transformations and abstractions (functions / methods)
//     often relying on the use of higher order functions and function composition

// Declarative Programming Key Characteristics

//   - Immutability: data structures are typically not directly modified
//                   new data structures are created based on transformations by higher order functions

//   - Higher Order Function: the role of higher order function in declarative programming
//                            is to operate on other functions or data structures to abstract away low level
//                            iteration and control flow (looping and conditional branching / pattern matching) 

//   - Functional Composition: building complex operations by combining small reusable functions (lambda calculus currying)
//                             often done through method chaining or the use of closures / callbacks and higher order functions

// Declarative Programming Summary

//   - focuses on the result of a computation, describing data transformations and relationships (through higher order functions)
//     relying on functions that encapsulate the process of computation (closures / callbacks) and returning new data structures (immutability)

//  Functional Composition

//   - combines two functions to produce a new function
//     apply the result of the first function to the output of the second

//   - may use the concepts of higher order functions and closures / callbacks

//  Method Chaining

//   - an object oriented programming feature in which methods
//     of an object are chained togeather through sequential invocation
//     typically applying some transformation on an object

//   - method chaining may modify an ojbects state (have side effects) or return a new object
//     depending on the type of methods being invoked (Mutator, Observer, or Producer)

// Differences: Functional Composition and Method Chaining

// - method chaining is an object oriented feature, whereas funcional composition does not need objects

// - method chaining may have side-effects that mutate the objects internal state,
//   whereas functional composition uses closures to capture state in an immutable fashion
//   as each function produces a new output without modifying the input

// - method chaining is syntactically different as it uses dot notation,
//   whereas functional composition uses higher order functions and closures


// Similarities: Functional Composition and Method Chaining 

//   -  While conceptually distinct, method chaining and functional composition share a common theme:
//      sequential application of operations.

//   - they share the core principle of chaining operations together to achieve complex results