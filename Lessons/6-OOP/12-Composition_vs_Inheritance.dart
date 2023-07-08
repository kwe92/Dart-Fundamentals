// Composition over Inheritance

//   - as seen in previous lessons inheritance is the
//     process of a sub-class inheriting variables and methods
//     of a super-class in which the sub-class
//     inheritance makes the sub-class tightly coupled to the super=class implementation
//     the sub-class has the ability to re-implement the methods in a diffrent way
//     this can lead to some difficult U.I. bugs

// Composition

//   - composition aims to decouple implementations
//     by seperating classes entirely
//   - the User Interface is instead made up of small components or widgets
//   - that act as constituent parts which then
//   - combined to create entire User Interfaces
//   - this allow seperation of concerns
//   - keeps code D.R.Y
//   - encapsulates isolated parts of your User Interface

class Widget extends Object {
  const Widget();
}

class Text extends Widget {
  final String text;
  const Text(this.text);

  @override
  String toString() => '$text';
}

typedef VoidCallback = void Function();

class Button extends Widget {
  final Widget child;
  final VoidCallback onPressed;

  const Button({
    required this.child,
    required this.onPressed,
  });
}

final VoidCallback handleOnPressed = () => {
      print('Button pressed'),
    };

void main() {
  final Button buttonComponent = Button(
    child: Text('I am a Text Widget'),
    onPressed: handleOnPressed,
  );

  print('\n child propery of button: ${buttonComponent.child}\n');
  print('\n onPressed propery of button: ${buttonComponent.onPressed}\n');
}
