class AnimeCharacter3 {
  String? fname, lname, anime;
}

void main() {
  // creating an Object
  final animeCharacter3 = AnimeCharacter3();

  // assign values
  animeCharacter3
    ..fname = 'Shikamaru'
    ..lname = 'Nara'
    ..anime = 'Naruto';

  // instantiate && assign values simultaneously
  final animeCharacter4 = AnimeCharacter3()
    ..fname = 'Houtarou'
    ..lname = 'Oreki'
    ..anime = 'Hyouka';

  print('favorite anime character: ${animeCharacter3.fname} ${animeCharacter3.lname}\n');
  print('Another favorite anime character: ${animeCharacter4.fname} ${animeCharacter4.lname}\n');
}


// Initalizing Null Formal Parameters

// Declaring Null member variables

//   - instance fields declared null get initalized as null Objects implicitly

//   - to declare a nullable variable suffix its type annotation with [?]
//       - e.g.
//           - String? nullable string


// Class with all nullable member variables

//   - constructor can be ommited entirely

//   - if the constructor is ommited there is an
//     unnamed no arguement constructor generated (Default Constructor)