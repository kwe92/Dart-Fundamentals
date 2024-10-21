Map<String, Object?> useFetch() => {'fname': 'Gaara', 'lname': 'Sabaku', 'age': 15};

class Person {
  final String fname, lname;
  final int age;

  Person.fromJSON(Map<String, dynamic> json)
      : fname = json['fname'],
        lname = json['lname'],
        age = json['age'];
}

class Employee extends Person {
  Employee() : super.fromJSON(useFetch());
}

void main() {
  final emp1 = Employee();
  print(emp1.fname);
}


// Non-default superclass Constructors

//   - when you implement a constructor explicitly the default constructor is implictly removed

//   - you must call one of the super classes implemented constructors in the above case

//   - you must call the constructor but you do not have to use the same type of constructor
//     i.e. if the super class constructor is named you can use a generative constructor in
//     the sub-type and invoke the super classes named constructor but you can not use super-initializer parameters
//     and must explicitly pass each parameter into the super classes named invocation

//   - Dart evaluates the arguments to the super class constructor before invoking the subclass constructor
//     so an argument to the super class constructor can be an expression like a function call rather than being required to be constant