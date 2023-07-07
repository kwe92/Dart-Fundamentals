// ignore_for_file: unused_local_variable

//todo: Add Comments
// Flutter Widgets
//    - In flutter everything is a widget

class Widget {}

class Text extends Widget {
  Text(this.string);
  final String string;
}

class Button extends Widget {
  Button({required this.child, this.onPressed});
  final Widget child;
  final void Function()? onPressed;
}

void main() {
  final b1 = Button(
    child: Text('Hello!'),
    onPressed: () => print('Button Pressed!'),
  );
}
