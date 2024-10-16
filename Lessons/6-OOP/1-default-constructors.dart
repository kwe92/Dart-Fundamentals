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

// Class

//   - a blueprint for creating objects

//   - defines the instance fields and methods that an object of that type will have

//   - classes can optionally implement an interface or abstract class providing concrete implementations (method bodies)
//     for the set of methods defined in the implemented interface or abstract class

// Object

//   - an object is an instance of a Type (Class) with specific data (attributes / instance fields / instance variables / properties)
//     and behavior implemented by the associated methods of the instantiated class

// Constructors

//   - special functions that create instances of classes (Objects) in Object-Oriented Languages


// Default Constructor

//   - if no constructor is specified a default constructor is created

//   - default constructors create instances of classes and do not take arguments

//   - all instance fields must be nullable and not prefixed with final or an explicit constructor must be implemented


