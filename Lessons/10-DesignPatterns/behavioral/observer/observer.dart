// ignore_for_file: unused_field
import 'dart:async';

// TODO: Add notes
typedef Subscriber = StreamSubscription<Widget> Function(void Function(Widget)?,
    {bool? cancelOnError, void Function()? onDone, Function? onError});

abstract class DialogDirector {
  void createWidgets();
}

abstract class Widget {
  // sync: true: creates a synchronous controller that notifies listeners immediately
  // When you set sync: true, the StreamController bypasses the Event Loop and acts almost exactly like a direct method call.
  StreamController<Widget> _controller = StreamController.broadcast(sync: true);

  Subscriber get subscribe => _controller.stream.listen;

  void notifyListeners() {
    _controller.add(this);
  }

  void dispose() => _controller.close();
}

class ListBox extends Widget {
  final _items = <String>[];
  String _selection = "";

  List<String> get items => _items;
  String get selection => _selection;

  void setItems(List<String> items) {
    _items.clear();
    _items.addAll([for (final item in items) item.toLowerCase()]);
    notifyListeners();
    print("selectable items updated.");
  }

  void selectItem(String item) {
    if (_items.contains(item.toLowerCase())) {
      _selection = item;
      notifyListeners();
      print("selected dropdown item updated.");
    }
  }
}

class EntryField extends Widget {
  String _text = "";
  String get text => _text;

  void setText(String text) {
    _text = text;
    notifyListeners();
    print("EntryField text updated.");
  }
}

class Button extends Widget {
  final String _label;
  bool _isEnabled = false;

  String get label => _label;
  bool get isEnabled => _isEnabled;

  Button(String label) : this._label = label;

  void setEnabled(bool enabled) {
    if (_isEnabled != enabled) {
      _isEnabled = enabled;
      print("[Button: $_label] Enabled state changed to: $_isEnabled");
    }
  }

  void click() {
    if (_isEnabled) {
      print("[Button: $_label] CLICKED! Dialog submitted.");
      notifyListeners();
    } else {
      print("[Button: $_label] Cannot click (Disabled).");
    }
  }
}

class FontDialogDirector implements DialogDirector {
  late ListBox _fontList;
  late EntryField _fontName;
  late Button _okButton;
  late Button _cancelButton;

  ListBox get fontList => _fontList;
  EntryField get fontName => _fontName;
  Button get okButton => _okButton;
  Button get cancelButton => _cancelButton;

  FontDialogDirector() {
    createWidgets();
    _setObservers();
  }
  @override
  void createWidgets() {
    _fontList = ListBox();
    _fontName = EntryField();
    _okButton = Button("Submit");
    _cancelButton = Button("Cancel");
    _fontList.setItems(["Arial", "Times New Roman", "Courier"]);
    _okButton.setEnabled(false);
  }

  void _setObservers() {
    _fontList.subscribe((_) {
      // The selected text has as changed within the ListBox widget so the text within the EntryField widget should reflect the newly selected text
      print("  -> Mediator: ListBox changed. Updating EntryField...");
      _fontName.setText(_fontList.selection);
    });
    _fontName.subscribe((_) {
      print("  -> Mediator: EntryField changed. Checking Button state...");
      _fontName.text.isNotEmpty ? _okButton.setEnabled(true) : _okButton.setEnabled(false);
    });
    _okButton.subscribe((_) {
      print("  -> Mediator: OK Button clicked. Closing dialog.");
    });
    _cancelButton.subscribe((_) {});
  }

  void dispose() {
    _fontList.dispose();
    _fontName.dispose();
    _okButton.dispose();
    _cancelButton.dispose();
  }
}

void main() {
  final director = FontDialogDirector();
  director.okButton.click();
  director.fontList.selectItem("Arial");
  director.okButton.click();
  director.fontName.setText("");
  director.okButton.click();
  director.dispose();
}
