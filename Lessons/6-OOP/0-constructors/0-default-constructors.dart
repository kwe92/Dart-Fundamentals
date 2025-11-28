// class omitting constructor, so default constructor implicitly implemented
class Hero {
  String? heroName;
  String? email;

  @override
  String toString() => 'Person(name: $heroName, email: $email)';
}

void main() {
  final hero = Hero()
    ..heroName = 'Deku'
    ..email = 'youngMidoriya@mha.io';

  print(hero);
}

// Class (Concrete Product Type: Type Theory)

//   - a blueprint for creating objects

//   - defines the instance fields (internal state) and methods (operations) that an object of that type will have

//   - classes can optionally implement an interface or abstract class providing concrete implementations (method bodies)
//     for the set of methods defined in the defined interface or abstract class

// Object

//   - an object is an instance of a Type (Class) with specific data (attributes / instance fields / instance variables / properties)
//     and behavior implemented by the associated methods of the instantiated class

// Constructors

//   - special functions that create instances of classes (Objects) in Object-Oriented Languages

//   -  Constructor names can be either ClassName or ClassName.identifier in most modern Object-Oriented Languages

// Default Constructor

//   - if no constructor is specified a default constructor is created

//   - default constructors create instances of classes and do not take arguments

//   - all instance fields must be nullable or initalized with a value once declared
//     and not prefixed with final or an explicit constructor must be implemented

// Instance Variables

//   - an uninitialized instance variable declared with a nullable type has the value null

//   - non-nullable instance variables must be initialized

//   - there are three ways in which an instance variable can be initialized:

//     - have an initializer unpon variable declaration

//     - use an initializing formal parameter (be a parameter of the constructor function prefixed with this.fieldName)

//         - e.g. ClassConstructor(this.initializingFormal)

//     - be initialized in the constructor's initialization list
