// typedef variants

// typedef FavPhil = String Function(String); // option 1

// typedef String FavPhil(String name); // option 2

typedef FavPhil = String Function(String name);
void main() {
  final favPhilosopher = (String philosopher) => '$philosopher, was a great philosopher.';

  print(favPhilosopher('Marcus Aurelius'));

  var firstClassObjectFunction = (FavPhil favPhil, philName) => print(favPhil(philName));

  firstClassObjectFunction(favPhilosopher, 'Aristotle');
}
