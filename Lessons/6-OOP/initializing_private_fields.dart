// ignore_for_file: unused_field

class Person {
  String _firstName;

  String _lastName;

  String _email;

  Person({required String firstName, required String lastName, required String email})
      : _firstName = firstName,
        _lastName = lastName,
        _email = email;
}

void main() {
  final person = Person(firstName: 'some', lastName: 'random', email: 'person@gmail.com');

  print(person);
}

// Initializing Private Fields as Initializing Formal Parameters

//   - private fields can't be used as named initializing formals (N=named parameters can't start with an underscore)
//     and must be initialized with an initializer list instead
//     or marked as late and initialized in the constructor body (not idomatic nor recommended)

//   - private fields can be used as positional initializing formals