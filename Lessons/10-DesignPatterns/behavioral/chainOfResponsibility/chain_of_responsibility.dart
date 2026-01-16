// Help Request Topics

enum Topic {
  NO_HELP_TOPIC,
  PRINT_TOPIC,
  PAPER_ORIENTATION_TOPIC,
  APPLICATION_TOPIC;
}

// Interface for handling help requests
abstract class HelpHandler {
  HelpHandler? _successor;
  Topic _topic;

  HelpHandler([HelpHandler? handler, Topic topic = Topic.NO_HELP_TOPIC])
      : _successor = handler,
        _topic = topic;

  bool hasHelp() {
    return _topic != Topic.NO_HELP_TOPIC;
  }

  void setHandler(HelpHandler handler, Topic topic) {
    _successor = handler;
    _topic = topic;
  }

  // TEMPLATE METHOD (replace some but not all of an algorithm (i.e. function implementation))
  void handleHelp() {
    if (hasHelp()) {
      additionalHelp(); // Call the specific polymorphic action
    } else if (_successor != null) {
      print('${this} cannot handle the request passing request to successor ${_successor}...');
      _successor!.handleHelp(); // Pass down the chain
    } else {
      print('End of chain. No help found.');
    }
  }

  // Hook method, intended for Subclasses to override
  void additionalHelp();

  @override
  String toString() {
    final typeStr = super.toString().split(' ');
    final typeNameIndex = typeStr.length - 1;
    final result = typeStr[typeNameIndex].replaceAll(RegExp(r"'"), '');
    return result;
  }
}

abstract class Widget extends HelpHandler {
  // ignore: unused_field
  Widget? _parent;

  Widget(Widget? parent, [Topic t = Topic.NO_HELP_TOPIC])
      : _parent = parent,
        super(parent, t);
}

class Button extends Widget {
  Button(Widget? parent, [Topic topic = Topic.NO_HELP_TOPIC]) : super(parent, topic);

  @override
  void additionalHelp() {
    print('Button can handle request for ${_topic.name}');
  }
}

class Dialog extends Widget {
  Dialog(HelpHandler successor, [Topic topic = Topic.NO_HELP_TOPIC]) : super(null) {
    setHandler(successor, topic);
  }

  @override
  void additionalHelp() {
    print('Dialog can handle request for ${_topic.name}');
  }
}

class Application extends HelpHandler {
  Application(Topic topic) : super(null, topic);

  @override
  void additionalHelp() {
    print('Application can handle request for ${_topic.name}');
  }
}

void main() {
  Application application = new Application(Topic.APPLICATION_TOPIC);
  Dialog dialog = new Dialog(application);
  Button button = new Button(dialog);

  button.handleHelp();
}

// 1. Core Identity

      // Pattern Name: 
      // Category: 
      // Intent:

// 2. The Problem & Solution (Motivation)

      // Scenario:
      // Problem: 
      // Solution:

// 3. Participants


// 4. Consequences


// 5. Implementation Issues


// 6. Related Patterns


// 7. Sample Code Use Case & Analysis (Optional)