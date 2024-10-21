class AnimeCharacter {
  final String fname, lname, anime;

  // initalizing positional formal parameters in the head of the Generative Constructor
  AnimeCharacter(this.fname, this.lname, this.anime);
}

void main() {
  final animeCharacter2 = AnimeCharacter(
    'Gon',
    'Freecss',
    'Hunter x Hunter',
  );

  print('\nAnother one of my favorite animes: ${animeCharacter2.anime}\n');
}


// Initalizing Formal Parameters

//   - member variables can be initalized before the constructor body
//     by passing this.memberVariable into the head of the constructor function

//   - the constructor body can then be ommited for brevity requiring less code

//   - final member variables must be initalized
//     in the constructor function head or assigned a default value

// non-nullable variables

//   - the data type declared for a variable
//     is not suffixed with [?]