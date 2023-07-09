// Opertor overloading

//   - a feature found in most OOP languages distinct from method overriding
//   - operator overloading is a compile-time polymorphism
//   - user-defined custom implementations
//     of common operators such as:
//       - Arithmetic operators +, -, *
//       - Equality operators == and !=
//       - Relational operators >, >=, <, <=
//       - many more
// -
//   - e.g. the addition of two strings concatenates them

class Person {
  final String fname;
  final String lname;
  final int age;

  const Person({
    required this.fname,
    required this.lname,
    required this.age,
  });

  Family operator +(covariant Person other) => Family(people: [this, other]);

  @override
  String toString() => 'Person(fname: ${fname}, lname: ${lname}, age: ${age})';
}

class Family {
  final List<Person> people;
  const Family({required this.people});

  @override
  String toString() => 'Family($people)';
}

void main() {}
