// Declaring a Class Constructor

//   - Implement a constructor function within a class body
//   - which is a special method that has a name identical to the class name
//   - class constructors are then flaged by the compiler as special methods

// Generative Constructor

//   - the most common form of a constructor in all OOP languages
//   - creates a new instance of an Object

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

//   - the most verbose constructor
//   - member variables are declared (assigned a datatype) above the constructor function
//   - member variables are passed into the constructor function via this.memberVariable
//   - member variables are then initalized in the constructor function body
//   - this.memberVariable = memberVariable where both names are identical

void main() {
  final AnimeCharacter animeCharacter = AnimeCharacter(
    'Baki',
    'Hanma',
    'Baki The Grappler',
  );

  print('\nOne of my favorite animes: ${animeCharacter.anime}\n');
}
