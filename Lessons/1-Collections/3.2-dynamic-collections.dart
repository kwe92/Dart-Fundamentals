void main() {
  const addBlue = true;
  const addRed = true;

  const List<String> extraColors = [
    'purple',
    'orange',
  ];

  final List<String> colors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    for (var color in extraColors) color,
  ];

  print('colors1: $colors');
}
