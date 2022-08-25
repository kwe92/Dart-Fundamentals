void main() {
  // Adding a value to a Collection only if a condition is true
  var colors = ['green', 'yellow'];

  // Boolean values
  const addBlue = true;
  const addRed = false;

  // if the boolean value addBlue is true add 'blue' to the list
  if (addBlue) colors.add('blue');
  // if the boolean value addRed is true add 'red' to the list
  if (addRed) colors.add('red');

  print(colors);
  // The above if statement can be achieved with collection if
  // collection if is not an if statement but a way to conditionally add values to a collection
  colors = ['green', 'yellow', if (addBlue) 'blue', if (addRed) 'red'];

  // Adding values from an array to another array iterively
  var extraColors = ['purple', 'orange'];

  // Can use the built in List method .addAll
  colors.addAll(extraColors);

  print(colors);

  // Using collection for is another way to add alues from an array to another array iterively
  colors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    for (var color in extraColors) color,
  ];
  print('Value of colors array using collection if and for: $colors');

  // Unpacking iterables within iterables - spreads

  var myList = [1, 2, 3];

  print([...myList]);

  colors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    ...extraColors,
  ];

  print(colors);
}
