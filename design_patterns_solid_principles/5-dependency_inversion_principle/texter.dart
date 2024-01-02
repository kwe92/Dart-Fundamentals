// the only dependencies are abstractions (shared by high level and low level modules)

import 'abstract_message_sender.dart';
import 'abstract_owner.dart';

class Texter extends AbstractMessageSender {
  const Texter();

  @override
  void sendMessage(AbstractOwner owner, String message) {
    // ! a real implementation would validate text with RegEx to ensure you are receiving a proper phone number string
    print("Simulating sending text to ${owner.phoneNumber}");
  }
}
