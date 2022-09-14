// Mixins and Extentions
//  - two features of the dart language
//  - extends the functionality of existing types/classes

// Mixins
//  - typically dart classes can only extend one class but implement many classes
//  - Mixins also solve this problem
//  - Add functionality and code reuseablility to your classes

// Extentions
//  - adds functionality to existing classes
//    without modifying the underlying classes original functionality
//  - good for extending classes that exist in the dart SDK or 3rd party libraries

import 'dart:io';

// Adds functionality to a class
// reduces repeating yourself DRY - (Don't Repeat Yourself! - do it right the first time)
mixin Swim {
  void swimming() => stdout.write("Swimming\n");
}

// Create a class animal
// All animals breathe in some form
// not all animals swim
class Animal {
  void breathe() => stdout.write("Breathing!\n");
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
  human.breathe();
  human.swimming();
  nemo.breathe();
  nemo.swimming();
  longNeck.breathe();
  return 0;
}
