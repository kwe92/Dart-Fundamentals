class Person {
  final String fname, lname;

  Person.fromJSON(Map<String, dynamic> json)
      : fname = json['fname'],
        lname = json['lname'];

  @override
  String toString() => 'Person(fname: $fname, lname: $lname)';
}

class Engineer extends Person {
  final List<String> progLangs;

  // with super-initializer parameters, parameters do not have to be passed to super constructor
  Engineer.fromJSON(super.json)
      : progLangs = json['progLangs'] as List<String>,
        super.fromJSON();

  @override
  String toString() => 'Engineer(fname: $fname, lname: $lname, progLangs: $progLangs)';
}

class DataAnalyst extends Engineer {
  final List<String> analyticsTools;

  // without super-initializer parameters, parameters must be passed to supper constructor
  DataAnalyst.fromJSON(Map<String, dynamic> json)
      : analyticsTools = json['analyticsTools'],
        super.fromJSON(json);

  @override
  String toString() => 'DataAnalyst(fname: $fname, lname: $lname, progLangs: $progLangs, analyticsTools: $analyticsTools)';
}

void main() {
  final person1 = Person.fromJSON(personHashMap);

  final engineer1 = Engineer.fromJSON(engineerHashMap);

  final dataAnalyst1 = DataAnalyst.fromJSON(dataAnalyst);

  print('person1: $person1');

  print('engineer1: $engineer1');

  print('dataAnalyst1: $dataAnalyst1');
}

final personHashMap = {
  'fname': 'Baki',
  'lname': 'Hanma',
};

final engineerHashMap = {
  'fname': 'Baki',
  'lname': 'Hanma',
  'progLangs': ['HTML', 'CSS', 'JavaScript', 'TypeScript', 'Python', 'SQL', 'Dart']
};

final dataAnalyst = {
  'fname': 'Baki',
  'lname': 'Hanma',
  'progLangs': ['Python', 'SQL'],
  'analyticsTools': ['Power BI', 'Tableau']
};

// Super Class No Default Constructor (No Generative Constructor)

//   - if a super-class does not have a default constructor
//     then a unnamed no-argument constructor is created

// Super-class Named Constructor

//   - must initalize the super class named constructor in
//     the sub-class with an Initalizer List
