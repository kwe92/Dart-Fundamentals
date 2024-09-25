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


// forEach

//   - a method collections have in Dart 3

//   - takes as a positional argument a callback to execute for every element

//   - returns void and not a new lazy iterable

//   - NOTE: it is better to use list comprehension (collection for) and return a new list