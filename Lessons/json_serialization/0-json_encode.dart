import 'dart:convert';

import 'package:http/http.dart';

class Ninja {
  final String name;
  final String power;
  final String clan;

  const Ninja({
    required String this.name,
    required String this.power,
    required String this.clan,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'power': power,
      'clan': clan,
    };
  }

  factory Ninja.fromMap(Map<String, dynamic> map) {
    return Ninja(
      name: map['name'] ?? '',
      power: map['power'] ?? '',
      clan: map['clan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Ninja.fromJson(String source) => Ninja.fromMap(json.decode(source));

  @override
  String toString() => 'Ninja(name: $name, power: $power, clan: $clan)';
}

void main() {
  // deserialize json string into an array of dynamic objects
  final List dynamicData = jsonDecode(jsonStringArray);

  // down-cast the deserialized dynamic array to retrieve the type of its elements
  final domainData = List<Map<String, Object?>>.from(dynamicData);

  // create domain models from the hash maps of deserialized data
  final domainModels = domainData.map((data) => Ninja.fromMap(data)).toList();

  // serialize objects into json strings
  final response = Response('${[for (final Ninja model in domainModels) jsonEncode(model.toMap())]}', 200);

  print('domain models: ${domainModels}\n');

  print('jsonStringArray: $jsonStringArray\n');

  print('response.body: ${response.body}\n');

  print('decoded response.body: ${jsonDecode(response.body)}\n');
}

// represents a json array

final jsonStringArray = '''
[{"name": "Gaara", "power": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "power": "shadows", "clan": "leaf ninja"}]
''';

  // JSON (JavaScript Object Notation)

  //   - text format for storing and transporting data

  //   - defines objects with properties as key/value pairs

  //   - essentially JSON is a string of one Struct or a string of an array of Structs separated by commas
  //     whose data consists of key/value pairs where the key is a field name (in double qoutes) and a value
  
  //   - json objects have required double-quotes surrounding the key (name) and
  //     double-quotes surrounding the value if the value is a string

  //   - json represents data in a structured (literally Struct objects) format that's easy for both humans and computers to understand

  // Serialization - Encoding

  //   - turning a data structure into a string

  //   - convert object to a json object

  //   - serialization can also commonly refers to the entire process of translating data structures
  //     to and from a more easily readable format i.e. encompass both processes on encoding and decoding data structures 

  // jsonEncode

  //   - part of the dart convert library

  //   - an easy and convenient way to convert any Object to a JSON string

  //   - turning a data structure into a string

  // Types of Serialization

  //   - manual Serialization with standard library API's (typically used for smaller projects, as it can get hard to manage and become error prone)

  //   - automated serialization with code generation (used in larger projects if available for you language, minimize the risk of having JSON serialization exceptions at runtime)

  //       - https://pub.dev/packages/json_annotation

  // Serializing JSON Models

  //   - there are two ways you can serialize json models:

  //       - serializing JSON inline

  //       - serializing JSON inside of a model class

  //   - the second approach is prefered as it is less error prone
  //     and keeps code D.R.Y as you do not have to keep
  //     typing the same serialization code over and over again

  //   - with the second approach you also retain compile-time type safety
  //     instead of the code crashing at run-time

  
