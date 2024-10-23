class Person {
  final String fname;

  final String lname;

  Person(this.fname, this.lname);

  // override the default toSting implementation obtained from the Object super-class
  @override
  String toString() {
    print('default toSting implementation result on Object: ${super.toString()}');

    return 'Person($fname, $lname)';
  }
}

void main() {
  // declare and initialize an object
  final object = Object();

  // print object with its toString method implementation
  print('default toSting implementation result on Object: ${object.toString()}');

  final person = Person('Subaru', 'Natsuki');

  print(person.toString());
}

// Overriding Methods

//   - when inheriting from a super-class the sub-class inherits all of the
//     methods implemented in the super-class

//   - sometimes the default super-class implementation of a method does not
//     suit the needs of the sub-class inthe context it wil be used in

//   - overriding gives the sub-class the ability to polymorphically reimplement
//     a method that was defined and implemented in the super class

//   - all methods implemented in a class have the implicit abaility to be overriden
//     unlike C++ where methods need to be explictly marked as 'vitrual' to be overriden

//   - to call the method that was overridden by the sub-class in the sub-class use:

//       - super.MethodName(params?);
 