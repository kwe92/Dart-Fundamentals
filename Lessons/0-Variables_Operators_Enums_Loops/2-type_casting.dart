// Type Casting || Type Conversion

//   - Convert one data type to another
//   - Can be done:
//     - implicitly by the compiler (var keyword)
//     - explicitly by the developer (compile-time)
//     - destination data type can not be smaller than the source

void main() {
  // Example: Converting String to int

  //  .parse method

  //    - int and double have this method
  //    - converts a string literal into the respectve type

  // .toString method

  //   - Returns the object as a String literal

  const String x = '42';
  final int y = int.parse(x);
  final String z = y.toString();

  print(x);

  print(y);

  print(z);

  // .runtimeType

  //   - a property that all objects have
  //   - The type of a variable at runtime

  print(x.runtimeType);

  print(y.runtimeType);

  print(z.runtimeType);
}
