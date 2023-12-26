// Central location for abstractions and concretions

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

/// Responsible for the creation of all consumed class implementations for both low level and high level modules
class Factory {
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


// TODO: rewrite notes | WFW
// The Factory Method pattern, sometimes referred to as the Virtual Constructor pattern, provides a way to conceal an object's creation logic from client code, but the object returned is guaranteed to adhere to a known interface. It's one of the most widely used creational patterns, because it adds a lot of flexibility to your object creation architecture without adding much complexity.
