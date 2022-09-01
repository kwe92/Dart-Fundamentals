// Create a Celsius Temperature Class
// that can be created using celsius or farenheit
// With two named constructors:
//    - celsius and farenheit respectively
// Member variables:
//    - celsius(mutable)

// Use the named constructor to cinstruct a Temperature class
// farehenheit to celsius formula:
//    - (farenheit - 32) / 1.8

void main() {
  const TemperatureC tempc1 = TemperatureC(32);
  final TemperatureC tempc2 = TemperatureC.fromFarenheit(90);
}

class TemperatureC {
  const TemperatureC(this.celsius);
  TemperatureC.fromFarenheit(double farenheit)
      : celsius = convertFarenheit(farenheit);
  final double celsius;
}

double convertFarenheit(double farenheit) => (farenheit - 32) / 1.8;
