// Map<String, dynamic> useFetch() => {'fname': 'Gaara', 'lname': 'Sabaku', 'age': 15};

// typedef FetchApiData = void Function();

// class Person {
//   String fname, lname;
//   int age;
//   static late Map<String, dynamic> apiData;

//   Person.fromJSON(Map<String, dynamic> json)
//       : fname = json['fname'],
//         lname = json['lname'],
//         age = json['age'];
// }

// class Employee extends Person {
//   Employee() : super.fromJSON(useFetch());
// }

// void main() {
//   final Employee emp1 = Employee();
//   print(emp1.fname);
// }

void useFetch() => Person.apiData = {'fname': 'Gaara', 'lname': 'Sabaku', 'age': 15};

typedef FetchApiData = void Function();

class Person {
  String fname, lname;
  int age;
  static late Map<String, dynamic> apiData;

  Person.fromJSON(useFetch())
      : fname = apiData['fname'],
        lname = apiData['lname'],
        age = apiData['age'];
}

// class Employee extends Person {
//   Employee() : super.fromJSON(useFetch());
// }

void main() {
  // final Employee emp1 = Employee();
  // print(emp1.fname);
}
