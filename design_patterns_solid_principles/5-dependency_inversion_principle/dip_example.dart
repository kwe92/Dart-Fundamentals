// the only dependancies are abstractions (shared by high level and low level modules)
import 'abstract_chore.dart';
import 'abstract_maid.dart';
import 'abstract_owner.dart';
import 'factory.dart';
import 'logger.dart';

// DIP Example: Simple Maid Service Application

void main() {
  // require an abstraction (interface / abstract class) instead of a concrete implementation as a return type
  final AbstractOwner owner = Factory.createOwner(
    firstName: "Baki",
    lastName: "Hanma",
    email: "baki@grappler.io",
    phoneNumber: "1234567890",
    Address: "123 Japan st",
  );

  // require an abstraction (interface / abstract class) instead of a concrete implementation as a return type
  final AbstractMaid maid = Factory.createMaid(
    firstName: "Annalise",
    lastName: "Ramirez",
    email: "annaram@gmail.com",
    phoneNumber: "1234567890",
  );

  // require an abstraction (interface / abstract class) instead of a concrete implementation as a return type
  final AbstractChore chore = Factory.createChore(
    chore: "Wash and fold the clothes.",
    maid: maid,
    owner: owner,
  );
  chore.performedWork(3);

  chore.performedWork(2);

  chore.completeChore();

  print("all cached logs:\n");

  // declaratively print out each log
  Logger.logCache.forEach((logMessage) => print(logMessage));
}

// What are Design Patterns

//    - Repeatable best practices and concepts to solve common software design problems
//      and create a system of software that is:
//        - Maintainable, Readable, Testable, Scalable, Extensible, Modular, and Loosely Coupled

// Software Entity (in the context of this writing)

//    - Class, Function, Method, and Module

// Dependency Inversion Principle

//    - high level modules (classes that use other classes to perform a task)
//      should not depend on (import anything from) low level modules (concrete class implementations),
//      both should import and depend on abstractions (interfaces and abstract classes)
//
//    - abstractions (interfaces and abstract classes) should not depend on details (concrete method / concrete  bclass implementations).

//    - details (concrete implementations) should depend on abstraction contracts (design by contract)

//    - rely on abstractions and not concrete implementations

//    - no direct dependencies (the importing of concrete implementations), only depend on abstractions

//    - decouples code and objects are not instantiated internally (removing concrete implementation imports)

//    - centralized instantiation of classes using some form of
//      Dependency Injection or a Creational Design Pattern (e.g. Factory Pattern)

//    - you want to communicate through abstractions from top to bottom and from bottom to top

//    - use abstractions and composition instead of internally creating objects within classes 

//    - each constituent part (software entity) then becomes testable, reusable, and replaceable

//   - if it's not a primitive or part of the standard library / sdk it should be an abstraction??? [think this one over a bit]

// Benefits of The Dependency Inversion Principle

//    - self contained tiny abstractions (interfaces and abstract classes) that define contracts (set of rules for implementing and inheriting classes)

//    - Implementations are then replaceable without side effects so long as contracts (abstraction rules) are abidded by

//    - your systems is no longer monolithic, instead your system is modular, made up of loosely coupled constituent parts
//      allowing developers to make small changes without big issues (side effects)

//    - each component does one thing having a single responsibility

//    - your system is architected in a way to use dependency injection (one of many ways to implement the Dependency Inversion Principle)

//    - everything depends on abstractions (interfaces or abstract classes)

//    - unit testing and mocking becomes easier as you are not tightly coupled with the instantiation of classes

//    - Your high level modules are disconnected from low level modules (no imports of low level modules into high level modules and vice versa)

// High Level Module

//    - anything that is calling something else as a dependency

// Dependency

//   - an object, module, or package that another object, module, or package depends upon for its implementation to function
//   - a change in the object, module, or package that another object, module, or package depends upon can break the system if that dependency is concrete
