import 'dart:convert';

import '../../utility/spacedPrint.dart';

// TODO: add Response object

void main() {
  // parse and array of json objects into a List of dynamic elements
  final List jsonList = jsonDecode(jsonArray);

  // parse a single json object into a hash map with a string key and Object? value
  final Map<String, Object?> singleJson = jsonDecode(jsonString);

  // down-case an iterable to retrieve the type of its elements i.e. going from List<dynamic> to List<T>
  final domainData = List<Map<String, Object?>>.from(jsonList);

  prefixedSpacePrint('Decoded json data 1: $jsonList');

  prefixedSpacePrint('Decoded json type 1: ${jsonList.runtimeType}');

  prefixedSpacePrint('Decoded json data 2: $singleJson');

  prefixedSpacePrint('Decoded json data 2: ${singleJson.runtimeType}');

  prefixedSpacePrint('Decoded json data 3: $domainData');

  prefixedSpacePrint('Decoded json data 3: ${domainData.runtimeType}');
}

final jsonArray = '''
[{"name": "Gaara", "power": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "power": "shadows", "clan": "leaf ninja"}]
''';

final jsonString = '{"name": "Gaara", "power": "sand", "clan": "sand ninja"}';

void prefixedSpacePrint<T>(T obj) => spacedPrint(obj, prefix_space: true);

// Deserialization - Decoding

//   - turning a string into a data structure

//   - convert json to a domain specific object

// jsonDecode

//   - from the dart:convert library

//   - turning a string into a data structure


// jsonDecode can not specify two returns types depending on the json string received:

//   - an array of json objects as List<dynamic>

//   - a single json object as Map<String, dynamic>

//   - to specify the type of the elements within an array of json objects
//     returned by jsonDecode you must down cast using List.from as shown bellow