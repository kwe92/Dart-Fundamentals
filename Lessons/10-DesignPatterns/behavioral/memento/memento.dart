// ignore_for_file: unused_field

class EditorMemento {
  final String _content;
  final int _cursor;
  final DateTime _timestamp;

  EditorMemento(String content, int cursor)
      : _content = content,
        _cursor = cursor,
        _timestamp = DateTime.now();

  @override
  String toString() => "EditorMemento@$_timestamp";
}

class TextEditor {
  String _content = '';
  int _cursor = 0;

  String get content => _content;

  void type(String content) {
    _content += content;
    _cursor += _content.length;
    print("Typed content: $content | current text: $_content");
  }

  EditorMemento save() {
    final result = EditorMemento(_content, _cursor);
    print('saved state: $result');
    return result;
  }

  void restore(EditorMemento memento) {
    _content = memento._content;
    _cursor = memento._cursor;
    print("Curent text restored to previous state: $_content from $memento.");
  }
}

class History {
  List<EditorMemento> _undostack = [];
  final TextEditor _editor;
  History(TextEditor editor) : _editor = editor;

  void backup() => _undostack.add(_editor.save());

  void undo() => _undostack.length > 1 ? _editor.restore(_undostack[_undostack.length - 2]) : handleOneOrLess();

  void handleOneOrLess() {
    if (_undostack.isEmpty) {
      print("No content left to undo.");
      return;
    }

    _undostack.removeLast();

    if (_undostack.isEmpty) {
      _editor.restore(EditorMemento("", 0));
      return;
    }
  }
}

class EditorController {
  final TextEditor _editor;
  final History _history;
  String get content => _editor.content;

  EditorController(TextEditor editor, History history)
      : _editor = editor,
        _history = history;

  void saveOnType(String content) {
    _editor.type(content);
    _history.backup();
  }

  void type(String content) => _editor.type(content);

  void backup() => _history.backup();

  void undo() => _history.undo();
}

void main() {
  final editor = TextEditor();
  final history = History(editor);
  final controller = EditorController(editor, history);

  controller.undo();
  controller.saveOnType("Hello ");
  controller.saveOnType(", World ");
  controller.saveOnType("doG si ni ouy.");
  print("text editor: contents: ${controller.content}");
  controller.undo();
  print("text editor: contents: ${controller.content}");
}
