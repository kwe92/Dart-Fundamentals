// Mixins
//  - mixins one of two features in the dart language used for functionality extention
//    the mixin feature extends the functionality of existing types/classes

// Mixins
//  - typically dart classes can only extend one class but implement many classes
//  - Mixins also solve this problem
//  - Add functionality and code reuseablility to your classes

// Extentions
//  - adds functionality to existing classes
//    without modifying the underlying classes original functionality
//  - good for extending classes that exist in the dart SDK or 3rd party library

import 'dart:io';

// Adds functionality to a class
// reduces repeating yourself
// DRY - (Don't Repeat Yourself! - do it right the first time)
mixin Swim {
  void swimming() => stdout.write("Swimming!\n");
}

// Create a class animal
// All animals breathe in some form
// not all animals swim
class Animal {
  void breathing() => stdout.write("Breathing!\n");
}

// A human is an animal with the mixin functionality to swim
class Human extends Animal with Swim {
  // void swimming() => stdout.write("Swimming!\n");
}

// A fish is an animal with the mixin functionality to swim
class Fish extends Animal with Swim {
  // void swimming() => stdout.write("Swimming!\n");
}

// A giraffe is an animal that CAN NOT swim
// Not all animals swim so we cant add swim to the animal class logically
class Giraffe extends Animal {}

int main() {
  Human human = Human();
  Fish nemo = Fish();
  Giraffe longNeck = Giraffe();
  human.breathing();
  human.swimming();
  nemo.breathing();
  nemo.swimming();
  longNeck.breathing();
  return 0;
}

// Conclusion Mixins
//  - We can use mixin to add functionality to multiple classes
//    in a convenient way, while also reducing code duplication

// What are mixins good for?
//  - Defining behaviors or capabilities
//  - Classes can then inherit those behaviors in meaningful ways
//  - Creating a "shallow" class heirarchy - (good thing)
//  - Single inheritance (extends) leads to deep class hierarchies
//    "deep" class heirarchies makes code harder to maintain


// Is a class a mixin?
//  - YES
//  - All classes are mixins and can use the "with" key word

// Difference between a mixin and a class?
//  - mixins CAN NOT be instantiated / asigned a variable tag
//  - can not create instances of types(classes) declared mixins
//  - everything is an object and all objects are classes
//    classs -> object

// Verbs vs Nouns in programming
//  - the methods "swimming" and "breathing" are "verbs"
//    which represent an action

// Class names should be nouns
//  - Class names should refer to a thing (noun)
//  - not a single specific action (verb)
//  - use "mixin" instead of a class for verbs or actions

// Drawbacks of mixins
//  - mixins can not have constructors
//  - mixins are vulnerable to name collisions
//    the compiler does not warn you about name collisions
//  - consider these disadvanteges when using mixins over
//    abstract classes and interfaces
