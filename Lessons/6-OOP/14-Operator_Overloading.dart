// TODO: Finish expanding on the lesson
// TODO: Add try catch finally in main
// TODO: Maybe break apart into multiple lessons
// TODO: Add additional in depth comments
// TODO: add additional operator examples

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

  Person? copyWith([
    String? fname,
    String? lname,
    int? age,
  ]) =>
      Person(
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        age: age ?? this.age,
      );

  Family operator +(covariant Person other) => Family(people: [this, other]);

  @override
  String toString() => 'Person(fname: ${fname}, lname: ${lname}, age: ${age})';
}

class TypeError extends Error {
  final String? message;

  TypeError([this.message]);

  @override
  String toString() => message ?? super.toString();
}

class Family {
  final List<Person> people;
  const Family({required this.people});

  Family operator +(Object other) {
    if (other is Family) {
      return Family(people: this.people + other.people);
    }
    if (other is Person) {
      final additionalFamily = <Person>[...this.people, other];
      return Family(people: additionalFamily);
    }
    throw TypeError('\nThe type must be either Person or Family:\n\nRecieved a type of: ${other.runtimeType}');
  }

  @override
  String toString() => 'Family($people)';
}

void main() {
  final Person animeCharacter0 = Person(
    fname: 'Hinata',
    lname: 'Hyuga',
    age: 12,
  );
  final Person animeCharacter1 = Person(
    fname: 'Neji',
    lname: 'Hyuga',
    age: 14,
  );

  final Family hyugaClan = animeCharacter0 + animeCharacter1;
}
