import 'dart:convert';

// ignore_for_file: unused_local_variable, unused_import, dead_code
void main() {
  const addBlue = true;
  const addRed = false;

  const extraColors = ['purple', 'orange'];

  // spread operator

  //   - concise way to insert multiple values into a collection

  final List<String> colors0 = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    ...extraColors,
  ];

  print(colors0);
}
