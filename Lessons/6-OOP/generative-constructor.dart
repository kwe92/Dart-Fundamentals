// Class Constructor

//   - special method flagged by the compiler that have a name identical to the class name

// Generator Constructor

//   - creates a new instance (object) of a class and initializes associated class fields

// Dart Generator Constructors

//   - There are two types of Generator constructors in Dart

//   - The default Generative Constructor

//   - The Factory Generative Constructor (redirect constructor)

class AnimeCharacter {
  String fname, lname, anime;
  // Generative Constructor Function
  AnimeCharacter(this.fname, this.lname, this.anime) {
    this.fname = fname;
    this.lname = lname;
    this.anime = anime;
  }
}

// Generative Constructor Function Summary

//   - can be the most verbose constructor

//   - member variables are declared (assigned a datatype) above the constructor function

//   - member variables are passed into the constructor function head via this.memberVariable

//   - member variables are then initalized in the constructor function body

//   - this.memberVariable = memberVariable where both names are identical

//   - this afromentioned process is no longer required in dat 2.1+

void main() {
  final AnimeCharacter animeCharacter = AnimeCharacter(
    'Baki',
    'Hanma',
    'Baki The Grappler',
  );

  print('\nOne of my favorite animes: ${animeCharacter.anime}\n');
}
