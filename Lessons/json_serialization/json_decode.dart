import 'dart:convert';

import '../../utility/spacedPrint.dart';

// TODO: add Response object

// jsonDecode

//   - from the dart:convert librar

// parameterized function expression to keep code D.R.Y
void prefixedSpacePrint<T>(T obj) => spacedPrint(obj, prefix_space: true);

void main() {
  final jsonArray = '''
[{"name": "Gaara", "power": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "power": "shadows", "clan": "leaf ninja"}]
''';

  final jsonString = '{"name": "Gaara", "power": "sand", "clan": "sand ninja"}';

  // jsonDecode can not specify two returns types depending on the json string received:

  //   - an array of json objects as List<dynamic>
  //   - a single json object as Map<String, dynamic>
  //   - to specify the type of the elements within an array of json objects
  //     returned by jsonDecode you must down cast using List.from as shown bellow

  // parse and array of json objects into a List of dynamic elements
  final List<dynamic> dynamicList = jsonDecode(jsonArray);

  // parse a single json object into a hash map with a string key and dynamic value
  final Map<String, dynamic> dynamicJson = jsonDecode(jsonString);

  // down-case an iterable to retrieve the type of its elements i.e. going from List<dynamic> to List<T>
  final List<Map<String, dynamic>> domainData = List.from(dynamicList);

  prefixedSpacePrint('Decoded json data 1: $dynamicList');
  prefixedSpacePrint('Decoded json type 1: ${dynamicList.runtimeType}');
  prefixedSpacePrint('Decoded json data 2: $dynamicJson');
  prefixedSpacePrint('Decoded json data 2: ${dynamicJson.runtimeType}');
  prefixedSpacePrint('Decoded json data 3: $domainData');
  prefixedSpacePrint('Decoded json data 3: ${domainData.runtimeType}');
}
