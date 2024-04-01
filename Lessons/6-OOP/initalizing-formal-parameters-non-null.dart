// Initalizing Non-Null Formal Parameters

//   - member variables can be initalized before the constructor body
//     by passing this.memberVariable into the head of the constructor function

//   - the constructor body can then be ommited for brevity requiring less code

//   - non-nullable member variables must be initalized
//     in the constructor function head or assigned a default value

// Mutable (Stateful) Class

//   - member variables are mutable if they are
//     not prefixed with final or const upon declaration

// non-nullable variables

//   - the data type declared for a variable
//     is not suffixed with [?]

// Mutable Class
class AnimeCharacter {
  String fname, lname, anime;
  AnimeCharacter(this.fname, this.lname, this.anime) {
    this.fname = fname;
    this.lname = lname;
    this.anime = anime;
  }
}

class AnimeCharacter2 {
  String fname, lname, anime;
  AnimeCharacter2(this.fname, this.lname, this.anime);
  // constructor body is ommited
}

void main() {
  final AnimeCharacter2 animeCharacter2 = AnimeCharacter2(
    'Gon',
    'Freecss',
    'Hunter x Hunter',
  );

  print('\nAnother one of my favorite animes: ${animeCharacter2.anime}\n');
}
