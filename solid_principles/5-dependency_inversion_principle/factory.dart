// Central location the creation of concrete implementations

// dependencies are a mix of abstractions and their concrete implementations
import 'abstract_chore.dart';
import 'abstract_logger.dart';
import 'abstract_maid.dart';
import 'abstract_message_sender.dart';
import 'abstract_owner.dart';
import 'chore.dart';
import 'logger.dart';
import 'maid.dart';
import 'owner.dart';
import 'texter.dart';

/// Responsible for the creation (instantiation) of all consumed concrete class implementations for both high level and low level modules
class Factory {
  // private named constructor to prevent instantiation
  const Factory._();

  static AbstractOwner createOwner({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String Address,
  }) =>
      Owner(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        Address: Address,
      );

  static AbstractMaid createMaid({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) =>
      Maid(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
      );

  static AbstractChore createChore({
    required String chore,
    required AbstractMaid maid,
    required AbstractOwner owner,
  }) =>
      Chore(
        chore: chore,
        maid: maid,
        owner: owner,
        logger: createLogger(),
        emailer: createMessageSender(),
      );

// can easily switch out concrete implementations without propagation of effects as shown bellow

  // static AbstractMessageSender createMessageSender() => Emailer();
  static AbstractMessageSender createMessageSender() => Texter();

  static AbstractLogger createLogger() => Logger();
}

// Factory Method Pattern (Creational Design Pattern) | static Class That Creates Objects

//   - also referred to as the Virtual Constructor Pattern
//   - one of the most widely used creational design patterns
//   - used to create objects via a static Factory class
//   - the Factory class implements static methods containing creation logic, where objects are created at compile time
//   - Factory class methods create and return objects adhering to abstraction contracts (i.e. the return type of a Factory static method is an interface or abstract class)
//   - Factory method implementations conceal creation logic away from clients
//   - adds flexibility to object creation architecture without adding too much complexity
//   - you can't define static method signatures within an abstraction (interface / abstract base class)
//     therefore a static Factory Class is required to handle instantiation (creation of objects)
//   - contains concrete dependancies adhering to abstract contracts
