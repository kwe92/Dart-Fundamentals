void main() {
  final animeCharactersArray = ['Gaara Sabaku', 'Gon Freecss', 'Shikimaru Nara', 'Hotaro Oreki'];

  final arrayToMap = animeCharactersArray.asMap();

  print('\nTransformed List<String> to Map<int, String>: \n\n$arrayToMap\n');

  print('Enumerating over array: ');
  animeCharactersArray.asMap().forEach((index, value) => print('\nindex: $index: value: $value'));
  print('\n');
}


  // Enumeration

  //   - List.asMap can also act as a way to enumerate Lists

  //   - use the key from the callback as the index

  //   - .asMap provides a 1-to-1 mapping to the array index


// Enumerating Over Arrays

//   - accessing the index of an array

//  List.asMap() Method

//    - transforms the List into an unmodifed Map

//        - keys are integers

//        - values are any type you choose

//    - 1-to-1 mapping to array indices
