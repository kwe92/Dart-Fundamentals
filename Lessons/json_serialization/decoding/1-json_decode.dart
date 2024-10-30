import 'dart:convert';

import '../utility/prefixed_space_print.dart';

Future<void> main() async {
  // parse an array of json objects into a List of dynamic elements
  final jsonList = jsonDecode(jsonArray) as List;

  // parse a single json object into a hash map with a string key and Object? value
  final singleJson = jsonDecode(jsonString) as Map<String, Object?>;

  // down-cast Array to retrieve the type of its elements i.e. going from List<dynamic> to List<T>
  final domainData = List<Map<String, Object?>>.from(jsonList);

  // you can also down-cast when calling jsonDecode
  final domainData2 = (jsonDecode(jsonArray) as List).cast<Map<String, Object?>>();

  prefixedSpacePrint('Decoded json Array: $jsonList');

  prefixedSpacePrint('Decoded json Array type: ${jsonList.runtimeType}');

  prefixedSpacePrint('Decoded json single object: $singleJson');

  prefixedSpacePrint('Decoded json single object type: ${singleJson.runtimeType}');

  prefixedSpacePrint('Decoded json domainData data casted to correct type: $domainData');

  prefixedSpacePrint('Decoded json domainData data casted to correct type: ${domainData.runtimeType}');

  prefixedSpacePrint('Decoded json domainData2 data casted to correct type: $domainData2');

  prefixedSpacePrint('Decoded json domainData2 data casted to correct type: ${domainData2.runtimeType}');
}

const jsonArray = '''
[{"name": "Gaara", "affinity": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "affinity": "shadows", "clan": "leaf ninja"}]
''';

const jsonString = '{"name": "Gaara", "affinity": "sand", "clan": "sand ninja"}';


// Deserialization - Decoding

//   - turning a string into a data structure

//   - convert json to a domain specific object

// jsonDecode

//   - from the dart:convert library

//   - turning a string int JSON format into a data structure

// jsonDecode can specify two returns types depending on the json string received:

//   - an array of json objects as List<dynamic>

//   - a single json object as Map<String, dynamic>

//   - to specify the type of the elements within an array of json objects
//     returned by jsonDecode you must down cast the list
