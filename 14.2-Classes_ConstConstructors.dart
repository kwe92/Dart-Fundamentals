// Const Constructors
// Representing a Complex Number
// Complex Number
//    - A Complex number is a number that can be expressed in the form a + bi
//      where a && b are real numbers and i represents the imaginary unit.

void main() {
  const Complex c1 = Complex(2, 4);
}

// To initalize a const constructor the member variables must be:
//       - final (private members / immutable members)
class Complex {
  const Complex(this.re, this.im);
  final double re;
  final double im;
}
