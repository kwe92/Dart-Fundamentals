class AnimeCharacter {
  final String fname, lname, anime;

  // initalizing formal parameters: (this.fname, this.lname, this.anime)
  const AnimeCharacter(this.fname, this.lname, this.anime);
}

void main() {
  final animeCharacter = AnimeCharacter('Baki', 'Hanma', 'Baki The Grappler');

  print('\nOne of my favorite animes: ${animeCharacter.anime}\n');
}

// Class Constructor

//   - special methods flagged by the compiler that have a name identical to the class name
//     they are used to create objects (instances) of the class type

// Generative Constructor

//   - creates a new instance (object) of a class and initializes associated class fields

//   - essentially overrides the default constructor initializing fields and constructor body
//     as the name is identical to that of the class name and default constructor

// Generative Constructor Function Summary

//   - can be the most verbose constructor

//   - member variables are declared (assigned a datatype) above the constructor function

//   - member variables are passed into the constructor function head via this.memberVariable as 
//     initializing formal parameters

// Initializing Fields in Constructor Body

//   - fields in Dart used to be initalized in the constructor function body

//   - this.memberVariable = memberVariable where both names are identical

//   - no longer required in dat 2.1+


