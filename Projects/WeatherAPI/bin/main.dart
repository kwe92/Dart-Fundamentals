int main(List<String> arguments) {
  // defensive check
  //    - if the suffix after dart Projects/WeatherAPI/bin/main.dart
  //      is blank or a string with spaces print an return

  // List<String> arguments
  //  - a list of strings split by space
  //  - any string literal typed after:
  //    - dart Projects/WeatherAPI/bin/main.dart
  if (arguments.length != 1) {
    print("Syntax: dart Projects/WeatherAPI/bin/main.dart <city>");
    return 1;
  }
  final city = arguments.first;
  print(arguments.first);
  return 0;
}
