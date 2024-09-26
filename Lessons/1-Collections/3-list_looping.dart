void main() {
  List<String> heroNames = ['Gon', 'Deku', 'Gara', 'Shikamaru'];

  // Iterable iteration

  // forEach
  heroNames.forEach(
    (element) => print(
      element.toLowerCase(),
    ),
  );

  // for-in
  for (var hero in heroNames) {
    print(hero);
  }
  // for loop
  for (var i = 0; i < heroNames.length; i++) {
    print(heroNames[i].toUpperCase());
  }
}
