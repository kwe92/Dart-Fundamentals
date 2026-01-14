typedef Topic = int;

const Topic NO_HELP_TOPIC = -1;
const Topic PRINT_TOPIC = 1;
const Topic PAPER_ORIENTATION_TOPIC = 2;
const Topic APPLICATION_TOPIC = 3;

abstract class HelpHandler {
  HelpHandler? _successor;
  Topic _topic;

  HelpHandler([HelpHandler? handler, Topic topic = NO_HELP_TOPIC])
      : _successor = handler,
        _topic = topic;

  bool hasHelp() {
    return _topic != NO_HELP_TOPIC;
  }

  void setHandler(HelpHandler handler, Topic topic) {
    _successor = handler;
    _topic = topic;
  }

  // TEMPLATE METHOD (replace some but not all of an algorithm (i.e. function implementation))
  void handleHelp() {
    if (hasHelp()) {
      additionalHelp(); // Call the specific polymprhic action
    } else if (_successor != null) {
      print('${this} cannot handle the request passing request to successor ${_successor}...');
      _successor!.handleHelp(); // Pass down the chain
    } else {
      print('End of chain. No help found.');
    }
  }

  // Hook method, inteded for Subclasses to override
  void additionalHelp();

  @override
  String toString() {
    final instanceStr = super.toString().split(' ');
    final typeStr = instanceStr[instanceStr.length - 1];
    return typeStr;
  }
}

abstract class Widget extends HelpHandler {
  // ignore: unused_field
  Widget? _parent;

  Widget(Widget? parent, [Topic t = NO_HELP_TOPIC])
      : _parent = parent,
        super(parent, t);
}

class Button extends Widget {
  Button(Widget? parent, [Topic topic = NO_HELP_TOPIC]) : super(parent, topic);

  @override
  void additionalHelp() {
    print('Button can handle request for ${_topic}');
  }
}

class Dialog extends Widget {
  Dialog(HelpHandler successor, [Topic topic = NO_HELP_TOPIC]) : super(null) {
    setHandler(successor, topic);
  }

  @override
  void additionalHelp() {
    print('Dialog can handle request for ${_topic}');
  }
}

class Application extends HelpHandler {
  Application(Topic topic) : super(null, topic);

  @override
  void additionalHelp() {
    print('Application can handle request for ${_topic}');
  }
}

void main() {
  Application application = new Application(APPLICATION_TOPIC);
  Dialog dialog = new Dialog(application);
  Button button = new Button(dialog);

  button.handleHelp();
}
