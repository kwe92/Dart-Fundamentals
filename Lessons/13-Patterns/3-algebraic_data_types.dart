import 'dart:math';

// Example: Geometric Shapes

//   - each shape in the example has its own distinct structure and
//     way to calculate its area that differs depending on the variant being used

//   - instead of each sub-type of Shape overriding the calculateArea
//     method with its own individual implementation spread accross each sub-type

//   - the calculateArea method is instead implemented in a function, in this case
//     as a super-class method handling all possible implementation variants
//      by switching over the sub-types

//   - when using Switch expressions an pattern matching the switch must be
//     an exhaustive list of all sub-types

sealed class Shape {
  const Shape();

  double calculateArea() => switch (this) {
        Square(size: final l) => l * l,
        Circle(radius: final r) => pi * r * r,
      };

  @override
  String toString() => switch (this) {
        Square(size: final size) => 'Square(size: $size)',
        Circle(radius: final radius) => 'Circle(radius: $radius)',
      };
}

class Circle extends Shape {
  final double radius;

  const Circle({required this.radius});
}

class Square extends Shape {
  final double size;

  const Square({required this.size});
}

// class Triangle extends Shape {} // if uncommented, will render Switch expression incomplete

void main() {
  const square = Square(size: 19);

  const circle = Circle(radius: 3);

  print('$square has an area of ${square.calculateArea()}');

  print('$circle has an area of ${circle.calculateArea()}');
}

// Algebraic Data Types

//   - a way of defining a data structure that can take on one of many distinct forms

//   - a form of polymorhpism that relies heavily on pattern matching to handle
//     different variants of a data type based on its structure

//   - built upon type theory: Sum Types and Product Types

// When to Use The Algeraic Data Type Pattern

//   - you have a family of related types

//   - there is an operation (method) that each type or most types would have to override
//     in the family of types

//   - you want to group the behavior (method each sub-class would need to override)
//     in one place instead of spreading it across multiple implementations by overriding

// Object Destructuring in Switch Expressions

//   - the syntax of object destructuring in Switch expressions differs a bit

//   - you can not ommit the variable assignment

//   - the var or final keyword prefixes each variable instead of the name of the type

//   - you can not partially destructure an object but you can use wildcards on properties
//     you do not need to use in the case body