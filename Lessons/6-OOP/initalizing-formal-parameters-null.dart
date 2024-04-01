// Initalizing Null Formal Parameters

// Declaring Null member variables

//   - member variables declared null get initalized as Null Objects implicitly

//   - to declare a null member variable suffix its type with [?]
//       - e.g.
//           - String? would declare a member
//             variable as a mutable nullable String

// Class with nullable member variables

//   - constructor can be ommited entirely

//   - if the constructor is ommited there is an
//     unnamed no arguement constructor generated

//   - no arguement constructor implies you must instantiate the class
//     without arguments or use cascading during instantiation

// Mutable (Stateful) Nullable Class
//   the constructor can be ommited entirely
class AnimeCharacter3 {
  String? fname, lname, anime;
}

void main() {
  // creating an Object
  final AnimeCharacter3 animeCharacter3 = AnimeCharacter3();

  // assign values
  animeCharacter3
    ..fname = 'Shikamaru'
    ..lname = 'Nara'
    ..anime = 'Naruto';

  // instantiate && assign values simultaneously
  final AnimeCharacter3 animeCharacter4 = AnimeCharacter3()
    ..fname = 'Houtarou'
    ..lname = 'Oreki'
    ..anime = 'Hyouka';

  print('\nfavorite anime character: ${animeCharacter3.fname} ${animeCharacter3.lname}\n');
  print('\nAnother favorite anime character: ${animeCharacter4.fname} ${animeCharacter4.lname}\n');
}
