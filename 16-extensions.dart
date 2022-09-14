// Extensions

//  - extensions are one of two features in the dart language used for functionality extension
//  - a way to add functionality to existing types / classes

import 'dart:io';

// Extend functionality to class or type
// why use the "this" keyword?
//    we are inside an extension of the type String so this is the String class itself

extension on String {
  int? toIntorNull() => int.tryParse(this);
}

int main() {
  // parse string to integer
  stdout.write(int.tryParse('123'));
  endl();
  stdout.write('123'.toIntorNull());
  endl();
  return 0;
}

void endl() => stdout.write('\n');
