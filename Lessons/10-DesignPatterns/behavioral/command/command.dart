class Document {
  final String name;
  Document(this.name);
  void open() {
    print("Opening document $name...");
  }

  void paste() {
    print("pasting contents of the document: $name");
  }
}

class Application {
  List<Document> _docs = [];
  List<Document> get documents => _docs;

  void addDocument(Document doc) => _docs.add(doc);

  void removeDocument(String name) {
    final document = _docs.firstWhere((doc) => doc.name.toLowerCase() == name.toLowerCase(), orElse: () => Document(""));
    _docs.remove(document);
  }

  Document latestDocument() => _docs.last;

  bool hasDocuments() => _docs.isNotEmpty;
}

abstract class Command {
  void execute();
}

class OpenCommand extends Command {
  final Application _application;
  String _response;
  OpenCommand(Application application)
      : _application = application,
        _response = "";

  @override
  void execute() {
    _response = askUser();
    if (_response.isNotEmpty) {
      final document = Document(_response);
      _application.addDocument(document);
      document.open();
    }
  }

  String askUser() {
    // in a real implementation the user maybe prompted to enter the document name
    return 'my_document';
  }
}

class PasteCommand extends Command {
  final Application _application;
  PasteCommand(this._application);

  @override
  void execute() {
    if (_application.hasDocuments()) {
      final document = _application.latestDocument();
      document.paste();
    } else {
      print("There is no document to paste.");
    }
  }
}

class MacroCommand extends Command {
  List<Command> _commands = [];

  void add(Command command) {
    _commands.add(command);
  }

  void addMany(List<Command> commands) {
    _commands.addAll(commands);
  }

  void remove(Command command) {
    _commands.remove(command);
  }

  @override
  void execute() {
    for (final command in _commands) {
      command.execute();
    }
  }
}

void main() {
  final commands = MacroCommand();
  final application = Application();
  commands.addMany([PasteCommand(application), OpenCommand(application), PasteCommand(application)]);
  commands.execute();
}
