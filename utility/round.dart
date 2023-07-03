/// Round a number to a fixed percision
double round(double x, [int precision = 0]) => double.parse(
      x.toStringAsFixed(precision),
    );
