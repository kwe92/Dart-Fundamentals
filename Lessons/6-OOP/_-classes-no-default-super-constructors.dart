// Super Class No Default Constructor (No Generative Constructor)

//   - if a super-class does not have a default constructor
//     then a unnamed no-argument constructor is created

// Super-class Named Constructor

//   - must initalize the super class named constructor in
//     the sub-class with an Initalizer List

// Mutable Nullable Class

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

class DataAnalyst extends Engineer {
  final List<String> analyticsTools;

  DataAnalyst.fromJSON(super.json)
      : analyticsTools = json['analyticsTools'],
        super.fromJSON();

  @override
  String toString() => 'DataAnalyst(fname: $fname, lname: $lname, progLangs: $progLangs, analyticsTools: $analyticsTools)';
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

  final Map<String, dynamic> dataAnalyst = {
    'fname': 'Baki',
    'lname': 'Hanma',
    'progLangs': ['Python', 'SQL'],
    'analyticsTools': ['Power BI', 'Tableau']
  };
  final Person person1 = Person.fromJSON(personHashMap);

  final Engineer engineer1 = Engineer.fromJSON(engineerHashMap);

  final DataAnalyst dataAnalyst1 = DataAnalyst.fromJSON(dataAnalyst);

  print('person1: $person1');

  print('engineer1: $engineer1');

  print('dataAnalyst1: $dataAnalyst1');
}
