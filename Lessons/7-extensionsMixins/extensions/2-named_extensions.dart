import '2.1-number_parsing.dart';

void main() {
  final stringNum = '1538';

  // Parsing a string using the method toIntOrNull that is an extension to String type
  final result = stringNum.toIntOrNull();

  print('result of calling toIntOrNull: $result');
}

// Named Extentions

//  - extensions are useful to add functionality to existing types / classes

//  - in order to make extensions reuseable across multiple files you need
//    name your extensions to handle confilcts in API's