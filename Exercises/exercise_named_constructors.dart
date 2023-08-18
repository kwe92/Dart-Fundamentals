// Create a Celsius Temperature Class
// that can be created using celsius or farenheit
// With two named constructors:
//    - celsius and farenheit respectively
// Member variables:
//    - celsius(mutable)

// Use the named constructor to cinstruct a Temperature class
// farehenheit to celsius formula:
//    - (farenheit - 32) / 1.8

// TODO: ADD COMMENTS to main function and TemperatureC class

import '../utility/round.dart';

void main() {
  final Temperature temp1 = Temperature(32);

  final Temperature temp2 = Temperature.fromFarenheit(90);

  print('temp1.celsius: ${temp1.celsius} | temp2.celsius: ${round(temp2.celsius, 0)}');

  print('Conversion back to farenheit: ${temp1.farenheit}');

  print('set farenheit temp1 to 120 degrees: ${temp1.farenheit = 120}');

  print('New celsius temperature of temp1: ${temp1.celsius} | farenhiet temperature: ${temp1.farenheit}');
}

class Temperature {
  Temperature(this.celsius);

  Temperature.fromFarenheit(final double farenheit) : celsius = round((farenheit - 32) / 1.8);

  double get farenheit => round(celsius * 1.8 + 32);

  set farenheit(double farenheit) => celsius = round((farenheit - 32) / 1.8);
  double celsius;
}
