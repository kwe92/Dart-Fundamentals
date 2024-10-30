import 'dart:convert';

import 'package:http/http.dart';

import 'shared/models/ninja.dart';

void main() {
  // deserialize json string into an array of dynamic objects
  final dynamicData = jsonDecode(jsonStringArray) as List;

  // down-cast the deserialized dynamic array to retrieve the type of its elements
  final domainData = List<Map<String, Object?>>.from(dynamicData);

  // create domain models from the hash maps of deserialized data
  final domainModels = domainData.map((json) => Ninja.fromJson(json)).toList();

  // serialize objects into json strings
  final response = Response('${[for (final Ninja model in domainModels) jsonEncode(model.toJson())]}', 200);

  print('response dat: ${response.body}');
}

// represents a json array
final jsonStringArray = '''
[{"name": "Gaara", "affinity": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "affinity": "shadows", "clan": "leaf ninja"}]
''';

  // JSON (JavaScript Object Notation)

  //   - a structured text format for storing and transporting data
  //     easily readable by humans and computers

  //   - defines objects with properties as key/value pairs

  //   - JSON can be viewed as a string of one Struct or a string of an array of Structs
  //     separated by commas whose data consists of key/value pairs
  //     where the key is a field name (in double qoutes) and a value
  
  //   - json objects have required double-quotes surrounding the key (name) and
  //     double-quotes surrounding the value if the value is a string

  // Serialization - Encoding

  //   - turning a data structure into a string, i.e. converting objects int to json objects

  //   - all objects with at least one property can be converted into a structure equivalent (key value pairs without operations / methods)
  //     and that structure can be represented as a string and converted to a JSON object

  //   - serialization can also commonly refers to the entire process of translating data structures
  //     to and from a more easily readable format i.e. encompass both processes of encoding and decoding data structures 

  // jsonEncode

  //   - part of the dart convert library

  //   - an easy and convenient way to convert any Object to a JSON string

  // Types of Serialization

  //   - manual Serialization with standard library API's
  //     typically used for smaller projects, as it can get hard to manage and become error prone

  //   - automated serialization with code generation used in larger projects if available for you language
  //     and minimizes the risk of having JSON serialization exceptions at runtime

  //   - https://pub.dev/packages/json_annotation

  // Serializing JSON Models

  //   - there are two ways you can serialize json models:

  //       - serializing JSON inline

  //       - serializing JSON inside of a model class

  //   - the second approach is prefered as it is less error prone
  //     and keeps code D.R.Y as you do not have to keep
  //     typing the same serialization code over and over again

  //   - with the second approach you also retain compile-time type safety
  //     instead of the code crashing at run-time

  
