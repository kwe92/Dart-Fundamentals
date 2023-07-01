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

// Initalizing FormalParameters

//   - member variables can be initalized before the constructor body (in the head of the constructor function)
//   - the above constructor body can be ommited for brevity and less code
//   - non-nullable variables must be initalized or assined a default value

// Mutable(Stateful) Class with non-nullable variables

class AnimeCharacter2 {
  String fname, lname, anime;
  AnimeCharacter2(this.fname, this.lname, this.anime);
}

// nullable variables

//   - constructor can be ommited
//   - variables declared as null get initalized as Null objects implicitly
//   - if the constructor is ommited there is a unnamed no arguement constructor generated
//   - no arguement constructor means you must instantiate the class before initalizing variables

class AnimeCharacter3 {
  String? fname, lname, anime;
}

void main() {
  final AnimeCharacter animeCharacter = AnimeCharacter(
    'Baki',
    'Hanma',
    'Baki The Grappler',
  );

  final AnimeCharacter2 animeCharacter2 = AnimeCharacter2(
    'Gon',
    'Freecss',
    'Hunter x Hunter',
  );

  final AnimeCharacter3 animeCharacter3 = AnimeCharacter3();
  animeCharacter3
    ..fname = 'Shikamaru'
    ..lname = 'Nara'
    ..anime = 'Naruto';

  final AnimeCharacter3 animeChar4 = AnimeCharacter3()
    ..fname = 'Houtarou'
    ..lname = 'Oreki'
    ..anime = 'Hyouka';

  print('\nOne of my favorite animes: ${animeCharacter.anime}\n');
  print('\nAnother one of my favorite animes: ${animeCharacter2.anime}\n');
  print('\nfavorite anime character: ${animeCharacter3.fname} ${animeCharacter3.lname}\n');
}
