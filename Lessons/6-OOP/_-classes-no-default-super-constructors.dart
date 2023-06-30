class Person {
  String? fname, lname;

  Person.fromJSON(Map<String, dynamic> json)
      : fname = json['fname'],
        lname = json['lname'];

  @override
  String toString() => 'Person(fname: $fname, lname: $lname)';
}

class Engineer extends Person {
  final List<String> progLangs;

  Engineer.fromJSON(super.json)
      : progLangs = json['progLangs'] as List<String>,
        super.fromJSON();

  @override
  String toString() => 'Engineer(fname: $fname, lname: $lname, progLangs: $progLangs)';
}

void main() {
  final Map<String, String> personHashMap = {
    'fname': 'Baki',
    'lname': 'Hanma',
  };

  final Map<String, dynamic> engineerHashMap = {
    'fname': 'Baki',
    'lname': 'Hanma',
    'progLangs': ['HTML', 'CSS', 'JavaScript', 'TypeScript', 'Python', 'SQL', 'Dart']
  };
  final Person person1 = Person.fromJSON(personHashMap);

  final Engineer engineer1 = Engineer.fromJSON(engineerHashMap);

  print('person1: $person1');

  print('engineer1: $engineer1');
}
