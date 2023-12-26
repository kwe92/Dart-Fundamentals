import 'abstract_owner.dart';

abstract class AbstractMessageSender {
  const AbstractMessageSender();

  void sendMessage(AbstractOwner owner, String message);
}
