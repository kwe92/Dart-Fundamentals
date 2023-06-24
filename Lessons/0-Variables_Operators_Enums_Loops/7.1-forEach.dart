// forEach

//   - method collections in Dart 3
//   - argument is a callback, executes for every element
//   - returns void, not a new lazy iterable

void main() {
  List<String> dopeAnimeCharacters = [
    'Baki Hanma',
    'Ken Kaneki',
    'Yami Sukehiro',
    'Ban',
    'Thorfinn',
  ];

  final Map<String, String> hashMap = {
    "1": "keep",
    "2": "it",
    "3": "up",
  };

  hashMap.forEach(
    (String key, String value) => print(
      value.toUpperCase(),
    ),
  );

  dopeAnimeCharacters.forEach(
    (String hero) => print(hero),
  );
}
