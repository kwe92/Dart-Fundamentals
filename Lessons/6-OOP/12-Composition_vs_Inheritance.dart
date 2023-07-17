// Composition over Inheritance

//   - inheritance is the process of a sub-class
//     inheriting variables and methods of a super-class
//     inheritance tightly couples the sub-class to the super-class implementation
//     the sub-classes ability to re-implement the methods
//     of a super-class in a diffrent way can lead to some difficult U.I. bugs
//     in many modern frameworks

// Composition

//   - composition decouples implementations
//     by separating classes entirely
//   - a User Interface is made up of small components or widgets
//   - that act as constituent parts of a whole User Interfaces
//   - allowing separation of concerns
//   - keeps code D.R.Y
//   - encapsulates isolated parts of your User Interface
//     into individual instantiated objects

// Simulating a U.I.

// Abstract Widget Class to be inherited
abstract class Widget extends Object {
  const Widget();
}

// Text widget which inherits Widget
class Text extends Widget {
  final String text;
  const Text(this.text);

  @override
  String toString() => '$text';
}

typedef VoidCallback = void Function();

// Button Widget
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
