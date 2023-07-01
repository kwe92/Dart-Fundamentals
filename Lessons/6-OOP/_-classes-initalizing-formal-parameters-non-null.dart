// Initalizing Formal Parameters

//   - member variables can be initalized before the constructor body
//     by passing this.memberVariable into the head of the constructor function
//   - the constructor body can thrn be ommited for brevity requiring less code
//   - non-nullable member variables must be initalized
//     in the constructor function head or assigned a default value

// Mutable (Stateful) Class

//   - member variables are mutable if final or const is ommited upon declaration

// non-nullable variables

//   - the data type declared for a variable is not suffixed with [?]
//       - e.g.
//           - String? would declare a variable as a mutable nullable String

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
  AnimeCharacter2(this.fname, this.lname, this.anime); // constructor body is ommited
}

// nullable variables

//   - constructor can be ommited
//   - variables declared as null get initalized as Null objects implicitly
//   - if the constructor is ommited there is a unnamed no arguement constructor generated
//   - no arguement constructor means you must instantiate the class before initalizing variables

void main() {
  final AnimeCharacter2 animeCharacter2 = AnimeCharacter2(
    'Gon',
    'Freecss',
    'Hunter x Hunter',
  );

  print('\nAnother one of my favorite animes: ${animeCharacter2.anime}\n');
}
