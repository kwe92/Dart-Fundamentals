class Point {
  final int x;

  final int y;

  Point(this.x, this.y);
}

class Person {
  final String fname;

  final String lname;

  Person(this.fname, this.lname);
}

void main() {
  final point = Point(4, 2);

  // partial deconstruction, using getter only creating a new varaible with the getters name
  var Point(:x) = point;

  print(x);

  final person = Person('Dabi', 'Todoroki');

  // complete deconstruction, using getters and assigning the returned value to new variables
  var Person(fname: firstName, lname: lastName) = person;

  print('$firstName $lastName, the brighhtest flame.');
}


// Object Destructuring Pattern

//   - matches a pattern against a named object type allowing you
//     to destructure the objects data using the getters exposed
//     by the object to assign its values to local variables within the scope of the pattern

// Destructuring an Instance of a Class

//   - prefix the name of the type with var or final and the names of the properties
//     you would like to destructure

//   - if a variable with the getter name does not exist in the scope
//     of the destructuring statement then you can ommit the variable name
//     to assign to and use the getter name, which will create a new variable
//     with the getter name

