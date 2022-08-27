void main() {
  // TODO: Add anonymous function comments
  // TODO: Add First Class Object Comments
  // TODO:
  var favPhilosopher =
      (philosopher) => '$philosopher, was a great philosopher.';

  print(favPhilosopher('Marcus Aurelius'));

  var firstClassObjectFunction =
      (String Function(String) favPhil, philName) => {print(favPhil(philName))};

  firstClassObjectFunction(favPhilosopher, 'Aristotle');
}
