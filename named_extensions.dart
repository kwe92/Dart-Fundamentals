// Named Extentions
//  - extensions are useful to add functionality to existing types / classes
//  - in order to make extensions reuseable across multiple files you need
//    name your extensions

/*

extension on String {
  int? toIntOrNull() => int.tryParse(this);
}

*/

// import the named extension from number_parsing.dart

// note: you do not need to call or instantiate the named extension
//       you just need the extension named in the dart file being imported from

import 'number_parsing.dart';

int main() {
  final stringNum = '1538';
  print(
      'Parsing a string using the method toIntOrNull that is an extension to String type / class\n result of calling toIntOrNull: ${stringNum.toIntOrNull()}');
  return 0;
}
