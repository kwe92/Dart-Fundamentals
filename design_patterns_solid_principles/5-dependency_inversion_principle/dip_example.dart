// THE HIGH LEVEL MODULE

// the only dependancies are abstractions (shared by low level modules) and the factory class
import 'abstract_chore.dart';
import 'abstract_maid.dart';
import 'abstract_owner.dart';
import 'factory.dart';
import 'logger.dart';

// Example using simple maid service application

void main() {
  final AbstractOwner owner = Factory.createOwner(
    firstName: "Baki",
    lastName: "Hanma",
    email: "baki@grappler.io",
    phoneNumber: "1234567890",
    Address: "123 Japan st",
  );

  // require an abstraction (interface / abstract class) instead of a concrete implementation
  final AbstractMaid maid = Factory.createMaid(
    firstName: "Annalise",
    lastName: "Ramirez",
    email: "annaram@gmail.com",
    phoneNumber: "1234567890",
  );

  // require an abstraction (interface / abstract class) instead of a concrete implementation
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

//  TODO: Refactor Notes


// What are Design Patterns

//   - General repeatable best practices and concepts
//     that can be implemented in your code as solutions
//     to solve commonly occuring software design problems


// Dependency Inversion Principle

//   - `High level modules should not depend on low level modules,
//     both should depend on abstractions (Interfaces and Abstract Classes)
//     and abstractions should not depend on details (implementations).`
//   - centralized instantiation of classes using some creatinal pattern, in this case a factory pattern
//   - decouples code as classes are not instantiated internally but instead in one centralized location
//   - rely on interfaces and abstractions instead of concrete implementations
//   - similar to how M-V-VM used the MiewModel to instantiate the Model classes for the View and inject the created objects into the view
//   - Your high level modules are disconnected from low level modules allowing you to easily swap the implementation entirely (class name, property names of methods and method implementations as method signatures do not include property names)
//   - no direct dependencies (importing concrete implementations), only depend on abstractions and not implementations
//   - you want to talk to just interfaces from top to bottom and from botton to top
//   - each constituent part then becomes testable, reusable, replaceable and testable

// Denefits of Dependency Inversion Principle

//   - swapping out implementations can be done with ease and without propagation of effects as long as the contract (implementation of the subclass implementing the abstract class is the same i.e. implementor not defining things an an unexpected way)
//   - the application is no longer monolithic application and instead your system is decoupled, modular, and made of loosely coupled constituent parts
//   - single responsibility as each constituent part only does one thing 
//   - self contained tiny abstractions (interfaces and abstract classes) allowing implementations to easily be swapped out without side effect of propagation
//   - can make small changes without big issues
//   - sets you up for dependency injection (one of many ways to implement the Dependency Inversion Principle)
//   - everything depends on abstractions (interfaces or abstract methods)
//   - unit testing becomes easier as you are not tightly coupled with the instantiation of classes which means you can mock
//   - you can create quick implementations of any interface you need
//   = can use Dependency Injection to assign instances to interfaces

// High Level Module

//    - anything that is calling something else
//    - anything you call is a dependency
//    - has dependancies other than the Standard SDK or Standard Library
// 

//  TODO: Refactor Notes |WFW

// Dependency vs Import

// Generally, the use dependency indicates that a model element - not necessarily a package - requires another model element for its implementation
