// Factory Constructor

class Person {
  Person({required this.name, required this.age});
  final name;
  final age;

  factory Person.fromJSON(Map<String, Object> json) {
    final name = json['name'];
    final age = json['age'];
    if (name is String && age is num) {
      return Person(name: name, age: age);
    } else {
      throw UnsupportedError('name must be a String | age must be a num');
    }
  }

  Map<String, Object> toJSON() => {'name': name, 'age': age};

  @override
  String toString() => 'Name: $name' '\n' 'Age: $age';
}

void main() {
  final json = {'name': 'Kwe', 'age': 30};

  final Person p1 = Person.fromJSON(json);

  final json2 = p1.toJSON();

  print(p1);

  print(json2);
}
