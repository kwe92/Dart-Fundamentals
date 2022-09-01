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

void main() {
  const TemperatureC tempc1 = TemperatureC(32);
  final TemperatureC tempc2 = TemperatureC.fromFarenheit(90);

  print(
      'tempc1.celsius: ${tempc1.celsius} | tempc2.celsius: ${round(tempc2.celsius, 0)}');

  print('Conversion back to farenheit: ${tempc1.farenheit}');
}

class TemperatureC {
  const TemperatureC(this.celsius);
  TemperatureC.fromFarenheit(final double farenheit)
      : celsius = (farenheit - 32) / 1.8;
  double get farenheit => round(celsius * 1.8 + 32, 0);
  final double celsius;
}

double round(final num x, [final int r = 1]) =>
    double.parse(x.toStringAsFixed(r));
