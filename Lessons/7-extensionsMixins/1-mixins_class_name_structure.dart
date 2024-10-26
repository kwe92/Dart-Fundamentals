import 'dart:io';

class Animal {
  void breathing() => stdout.write("$this is breathing!\n");
}

mixin Swim {
  void swimming() => stdout.write("$this is swimming!\n");
}

// humans are animals with the ability to swim
class Human extends Animal with Swim {
  @override
  String toString() => 'Human';
}

// fish are animals with the ability to swim
class Fish extends Animal with Swim {
  @override
  String toString() => 'Fish';
}

// A giraffe is an animal that CAN NOT swim
class Giraffe extends Animal {
  @override
  String toString() => 'Giraffe';
}

void main() {
  var human = Human();

  var nemo = Fish();

  var longNeck = Giraffe();

  human.breathing();

  human.swimming();

  nemo.breathing();

  nemo.swimming();

  longNeck.breathing();
}

// Mixins

//   - mixins are one of two features in the dart language used for functionality extention

//   - Dart classes can only inherit from one super-class but can implement many classes

//   - mixins extend existing types/classes by adding functionality and code reuseablility to your classes

// What are mixins good for?

//   - add functionality to a sub family of types while still maintaining single inheritance of a super class

//   - defining behaviors or capabilities

//   - classes can then inherit those behaviors in meaningful ways

//   - creating a "shallow" class heirarchy - (good thing)

//   - "deep" class heirarchies makes code harder to maintain

//   - single inheritance (extends) leads to deep class hierarchies


// Difference between a mixin and a class?

//   - mixins CAN NOT be instantiated (created as an Object)

// Verbs vs Nouns in programming

//   - the methods "swimming" and "breathing" are "verbs"
//     which represent an action

// Class names should be nouns

//   - class names should refer to a thing (noun)

//   - not a single specific action (verb)

//   - use "mixin" instead of a class for verbs or actions

// Drawbacks of mixins

//   - mixins can not have constructors

//   - mixins are vulnerable to name collisions
//     and the compiler does not warn you about name collisions

//   - consider these disadvanteges when using mixins over
//     abstract classes and interfaces
