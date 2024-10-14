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


// Constructors

//   - special functions that create instances of classes in Object-Oriented Languages

//   - an object is an instance of a Type (Class) and can use all associated methods

// Default Constructor

//   - if no constructor is specified a default constructor is created

//   - default constructors create instances of classes and do not take arguments
