// typedef variants
// typedef FavPhil = String Function(String); // option 1
typedef String FavPhil(String name); // option 2
List s = [];
void main() {
  // TODO: Add anonymous function comments
  // TODO: Add First Class Object Comments
  // TODO: Add comments for typedef and what it does
  var favPhilosopher =
      (philosopher) => '$philosopher, was a great philosopher.';

  print(favPhilosopher('Marcus Aurelius'));

  var firstClassObjectFunction =
      (FavPhil favPhil, philName) => {print(favPhil(philName))};
  // (String Function(String) favPhil, philName) => {print(favPhil(philName))};

  firstClassObjectFunction(favPhilosopher, 'Aristotle');
}
