// Simulating a U.I.

abstract class Key<T extends Object> {
  final String value;

  Key(this.value);

  const Key.empty() : value = '';
}

// Abstract Widget Class to be inherited (extended)
abstract class Widget extends Object {
  final Key? key;

  const Widget({this.key});
}

// Text Widget which inherits (extends) Widget
class Text extends Widget {
  final String text;
  const Text(this.text, {super.key});

  @override
  String toString() => '$text';
}

typedef VoidCallback = void Function();

// Button Widget which inherits (extends) Widget
class Button extends Widget {
  final Widget child;
  final VoidCallback onPressed;

  const Button({
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
}

void main() {
  // Composition of widgets
  final buttonComponent = Button(
    child: Text('I am a Text Widget'),
    onPressed: () {
      print('Button pressed');
    },
  );

  print('\n' + 'child propery of button: ${buttonComponent.child}\n');
  print('åonPressed propery of button: ${buttonComponent.onPressed}\n');
}


// Composition over Inheritance

//   - build complex objects by combining simpler objects

// Inheritance

//   - Inheritance, a mechanism in object-oriented programming where a subclass inherits variables (attributes / fields)
//     and methods (functions) from a superclass, creating an "is-a" relationship (a subclass "is a" type of the superclass)

//   - promotes code reuse by avoiding duplication of common functionality

//   - enables the extension of existing behavior, making it possible to create new, specialized objects that build upon existing ones

//   - Inheritance creates a tight coupling between subclasses and superclasses, as changes to the superclass can affect all its subclasses

//   - Subclasses can override methods inherited from the superclass, allowing for customization of behavior
//     however, overriding methods requires careful consideration to ensure compatibility with the superclass's design
//     and to avoid unintended side effects due to inappropriate subclass implementations.

// Composition

//   - composition is a technique in object-oriented programming that achieves loose coupling between classes (decoupling implementations)
//     by using instances of other classes as components within a class

//   - complex objects are built by combining instances of simpler objects
//     creating a "has-a" relationship for example
//     a User Interface might be composed of individual widgets, each with its own functionality

//   - this approach promotes separation of concerns, making code easier to understand, maintain, and refactor

//   - composition also helps to keep code DRY (Don't Repeat Yourself)
//     by allowing common functionality to be reused across different objects

//   - by encapsulating individual components into separate objects
//     composition promotes modularity and reduces the impact of changes to individual parts of the system