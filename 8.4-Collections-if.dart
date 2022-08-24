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
}
