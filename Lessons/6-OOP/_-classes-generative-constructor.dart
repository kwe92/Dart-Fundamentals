// Declaring a Class Constructor

//   - Create a method with an identical name as the class
//   - which is then flaged by the compiler as a class constructor

// Generative Constructor

//   - most common form of constructor in all programming languages
//   - creates a new instance of an Object

class AnimeCharacter {
  String fname, lname, anime;
  AnimeCharacter(this.fname, this.lname, this.anime) {
    this.fname = fname;
    this.lname = lname;
    this.anime = anime;
  }
}

// Initalizing formal parameters

//   - member variables can be initalized before the constructor body
//   - you can ommit the above constructor body for brevity and less code
//   - non-nullable variables must be initalized or assined a default value

// non-nullable variables

class AnimeCharacter2 {
  String fname, lname, anime;
  AnimeCharacter2(this.fname, this.lname, this.anime);
}

// nullable variables

//   - constructor can be ommited
//   - variables flagged as null get initalized as Null objects
//   - if constructor is ommited there is a no arguement constructor generated

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

  print('\nOne of my favorite animes: ${animeCharacter.anime}\n');
  print('\nAnother one of my favorite animes: ${animeCharacter2.anime}\n');
  print('\nfavorite anime character: ${animeCharacter3.fname} ${animeCharacter3.lname}\n');
}
