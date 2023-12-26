// the only dependencies are abstractions (shared by the high level module)
import 'abstract_message_sender.dart';
import 'abstract_owner.dart';

class Emailer extends AbstractMessageSender {
  const Emailer();

  @override
  void sendMessage(AbstractOwner owner, String message) {
    print("Simulating sending email to ${owner.email}");
  }
}
