import '../7-Extensions_Mixins/number_parsing.dart';

void main() {
  const dynamic x = '42';

  final String y = x as String;

  final int z = y.toIntOrNull() ?? 0;

  print(x);

  print(y);

  print(z);

  print(x.runtimeType);

  print(y.runtimeType);

  print(z.runtimeType);
}


// Type Casting || Type Conversion

//   - Convert one data type to another

//   - Can be done:

//     - implicitly by the compiler (var keyword)

//     - explicitly by the developer (compile-time)

//     - destination data type can not be smaller than the source

  // Example: Converting String to int

  //  .parse method

  //    - int and double have this method
  
  //    - converts a string literal into the respectve type

  // .toString method

  //   - Returns the object as a String literal


  // .runtimeType

  //   - a property that all objects have

  //   - The type of a variable at runtime