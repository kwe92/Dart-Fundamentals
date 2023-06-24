int main() {
  const addBlue = true;
  const addRed = true;

  // elements can be predicates in Iterables
  // creating elements dynamily

  const List<String> extraColors = [
    'purple',
    'orange',
  ];

  final List<String> colors1 = [
    'green',
    'yellow',
    // predicates
    if (addBlue) 'blue',
    if (addRed) 'red',
    for (var color in extraColors) color,
  ];

  print(
    'colors1: $colors1',
  );

  return 0;
}
