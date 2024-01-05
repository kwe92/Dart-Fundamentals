import 'dart:convert';

import 'package:http/http.dart';

void main() {
  // JSON (JavaScript Object Notation)
  //   - text format for storing and transporting data
  //   - defines objects with properties as key/value pairs
  //   - essentially JSON is a string of one object or a string of an array of objects separated by commas
  //     whose data consists of key/value pairs where the key is a field name (in double qoutes) and a value
  //   - json objects have required double-quotes surrounding the key (name) and
  //     double-quotes surrounding the value if the value is a string

  // represents a json string
  final jsonStringArray = '''
[{"name": "Gaara", "power": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "power": "shadows", "clan": "leaf ninja"}]
''';

  // deserialize json string into an array of dynamic objects
  final List<dynamic> dynamicData = jsonDecode(jsonStringArray);

  // down-cast the deserialized dynamic array to retrieve the type of its elements
  final List<Map<String, dynamic>> domainData = List.from(dynamicData);

  // create domain models from the hash maps of deserialized data
  final List<Ninja> domainModels = domainData.map((Map<String, dynamic> data) => Ninja.fromMap(data)).toList();

  // serialize objects into json strings
  final Response response = Response('${[for (final Ninja model in domainModels) jsonEncode(model.toMap())]}', 200);

  print('domain models: ${domainModels}\n');

  print('jsonStringArray: $jsonStringArray\n');

  print('response.body: ${response.body}\n');

  print('decoded response.body: ${jsonDecode(response.body)}\n');
}

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
