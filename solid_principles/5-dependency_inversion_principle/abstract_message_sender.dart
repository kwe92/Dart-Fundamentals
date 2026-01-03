// the only dependency is an abstraction (shared by high level and low level modules)

import 'abstract_owner.dart';

abstract class AbstractMessageSender {
  const AbstractMessageSender();

  void sendMessage(AbstractOwner owner, String message);
}
