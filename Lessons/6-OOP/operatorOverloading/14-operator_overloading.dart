class Person {
  final String fname;
  final String lname;
  final int age;

  const Person({
    required this.fname,
    required this.lname,
    required this.age,
  });

  Person copyWith({
    String? fname,
    String? lname,
    int? age,
  }) =>
      Person(
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        age: age ?? this.age,
      );

  Family operator +(covariant Person other) => Family(people: [this, other]);

  @override
  String toString() => 'Person(fname: ${fname}, lname: ${lname}, age: ${age})';
}

class Family {
  final List<Person> people;
  const Family({required this.people});

  Family operator +(Object other) {
    if (other is Family) {
      return Family(people: this.people + other.people);
    }
    if (other is Person) {
      final additionalFamily = [...this.people, other];
      return Family(people: additionalFamily);
    }
    throw TypeError('The type must be either Person or Family:\nRecieved a type of: ${other.runtimeType}');
  }

  @override
  String toString() => 'Family($people)';
}

void main() {
  final animeCharacter0 = Person(
    fname: 'Hinata',
    lname: 'Hyuga',
    age: 12,
  );
  final animeCharacter1 = Person(
    fname: 'Neji',
    lname: 'Hyuga',
    age: 14,
  );

  final animeCharacter2 = Person(fname: 'Hiashi', lname: 'Hyuga', age: 42);

  final animeCharacter3 = Person(fname: 'Hizashi', lname: 'Hyuga', age: 42);

  final animeCharacter4 = Person(
    fname: 'Naruto',
    lname: 'Uzumaki',
    age: 13,
  );

  final hyugaSiblings = animeCharacter0 + animeCharacter1;

  final hyugaElderTwins = animeCharacter2 + animeCharacter3;

  final hyugaClan = hyugaSiblings + hyugaElderTwins;

  final uzumakiClan = Family(people: [animeCharacter4]);

  final uzumakiClanExtended = uzumakiClan + animeCharacter0.copyWith(lname: 'Uzumaki');

  print('Hyuga Clan: $hyugaClan\n');
  print('UzumakiClan Clan: $uzumakiClan\n');
  print('Hinata joins the Uzumaki Clan: $uzumakiClanExtended\n');

  try {
    uzumakiClanExtended + 'I should throw an error';
  } catch (error, st) {
    print('$error\n');
    print('Stack Trace:n$st');
  }
}

class TypeError extends Error {
  final String? message;

  TypeError([this.message]);

  @override
  String toString() => message ?? super.toString();
}


// Operator overloading

//   - add or override the implementation of operators

//   - a feature found in most OOP languages distinct from method overriding

//   - operator overloading is a compile-time polymorphism

//   - user-defined custom implementations
//     of common operators such as:

//       - Arithmetic operators: +, -, *

//       - Equality operators: == and !=

//       - Relational operators: >, >=, <, <=

//       - many more

//   - e.g. the addition of two strings concatenates them