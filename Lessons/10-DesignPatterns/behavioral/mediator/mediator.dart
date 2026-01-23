// ignore_for_file: unused_field
// TODO: Add notes

abstract class DialogDirector {
  void widgetChanged(Widget widget);

  void createWidgets();
}

abstract class Widget {
  final DialogDirector _director;
  Widget(DialogDirector director) : this._director = director;
  void changed() => _director.widgetChanged(this);
}

class ListBox extends Widget {
  final _items = <String>[];
  String _selection = "";

  ListBox(DialogDirector director) : super(director);

  List<String> get items => _items;
  String get selection => _selection;

  void setItems(List<String> items) {
    _items.clear();
    _items.addAll([for (final item in items) item.toLowerCase()]);
    changed();
    print("selectable items updated, $_director has been notified.");
  }

  void selectItem(String item) {
    if (_items.contains(item.toLowerCase())) {
      _selection = item;
      changed();
      print("selected dropdown item updated, $_director has been notified.");
    }
  }
}

class EntryField extends Widget {
  String _text = "";
  String get text => _text;

  EntryField(DialogDirector director) : super(director);

  void setText(String text) {
    _text = text;
    changed();
    print("EntryField text updated, $_director has been notified.");
  }
}

class Button extends Widget {
  final String _label;
  bool _isEnabled = false;

  String get label => _label;
  bool get isEnabled => _isEnabled;

  Button(DialogDirector director, String label)
      : this._label = label,
        super(director);

  void setEnabled(bool enabled) {
    if (_isEnabled != enabled) {
      _isEnabled = enabled;
      print("[Button: $_label] Enabled state changed to: $_isEnabled");
    }
  }

  void click() {
    if (_isEnabled) {
      print("[Button: $_label] CLICKED! Dialog submitted.");
      changed();
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
  }
  @override
  void createWidgets() {
    _fontList = ListBox(this);
    _fontName = EntryField(this);
    _okButton = Button(this, "Submit");
    _cancelButton = Button(this, "Cancel");
    _fontList.setItems(["Arial", "Times New Roman", "Courier"]);
    _okButton.setEnabled(false);
  }

  @override
  void widgetChanged(Widget widget) {
    if (widget == _fontList) {
      // The selected text has as changed within the ListBox widget so the text within the EntryField widget should reflect the newly selected text
      print("  -> Mediator: ListBox changed. Updating EntryField...");
      _fontName.setText(_fontList.selection);
    }
    if (widget == _fontName) {
      print("  -> Mediator: EntryField changed. Checking Button state...");
      _fontName.text.isNotEmpty ? _okButton.setEnabled(true) : _okButton.setEnabled(false);
    }
    if (widget == _okButton) {
      print("  -> Mediator: OK Button clicked. Closing dialog.");
    }
    if (widget == _cancelButton) {}
  }
}

void main() {
  final director = FontDialogDirector();
  director.okButton.click();
  director.fontList.selectItem("Arial");
  director.okButton.click();
  director.fontName.setText("");
  director.okButton.click();
}
