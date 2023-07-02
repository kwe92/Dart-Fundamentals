// Enumerating Over Arrays

//   - accessing the index of an array
//     during iteration (looping)

//  List.asMap() Method

//    - transforms the List into an unmodifed Map
//      where the keys of the Map are integers
//      with a 1-to-1 maping to the array indices

void main() {
  final List<String> animeCharactersArray = ['Gaara Sabaku', 'Gon Freecss', 'Shikimaru Nara', 'Hotaro Oreki'];

  final Map<int, String> arrayToMap = animeCharactersArray.asMap();

  print('\nTransformed List<String> to Map<int, String>: \n\n$arrayToMap\n');

  // Enumeration

  //   - List.asMap can also act as a way to enumerate arrays
  //   - use the key from the callback as the index
  //   - as it is a 1-to-1 mapping to the array index

  print('Enumerating over array: ');
  animeCharactersArray.asMap().forEach(
        (
          int index,
          String value,
        ) =>
            print('\nindex: $index: value: $value'),
      );
  print('\n');
}
