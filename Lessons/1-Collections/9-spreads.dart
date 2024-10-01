import 'dart:convert';

// ignore_for_file: unused_local_variable, unused_import, dead_code
void main() {
  const addBlue = true;
  const addRed = false;

  const extraColors = ['purple', 'orange'];

  final colors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    ...extraColors,
  ];

  print(colors);
}

  // spread operator

  //   - concise way to insert multiple values into a collection from another collection

  //   - a way to copy values to a reference pointing to a new place in memory (defensive copy)