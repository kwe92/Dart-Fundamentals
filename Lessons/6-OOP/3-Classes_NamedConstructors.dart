// ignore_for_file: unused_local_variable

void main() {
  const Complex c1 = Complex(0, 4);
  print('value of c1.re: ${c1.re}');

  // Some Special Complex Numbers;
  // 0 + i * 0
  final Complex zero = Complex(0, 0);
  final Complex zero2 = Complex.zero();

  // 1 + i * 0
  final Complex identity = Complex(1, 0);
  final Complex identity2 = Complex.identity();

  // a + i * 0
  const double a = 3;
  final Complex real = Complex(a, 0);
  final Complex real2 = Complex.real(a);

  // 0 + i * b
  const double b = 4;
  final Complex imaginary = Complex(0, b);
  final Complex imaginary2 = Complex.imaginary(b);
}

// To initalize a const constructor the member variables must be:
//       - final (private members / immutable members in and outside of the class)
class Complex {
  const Complex(this.re, this.im);
  // Represent Special Complex Numbers with Named Constructors
  Complex.zero()
      : re = 0,
        im = 0;
  Complex.identity()
      : re = 1,
        im = 0;
  Complex.real(double a)
      : re = a,
        im = 0;
  Complex.imaginary(double b)
      : re = 0,
        im = b;
  final double re;
  final double im;
}
