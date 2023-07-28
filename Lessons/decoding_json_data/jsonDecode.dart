import 'dart:convert';

import '../../utility/spacedPrint.dart';

// jsonDecode

//   - from the dart:convert library ??

// parameterized function expression to keep code D.R.Y
final prefixedSpacePrint = <T>(T obj) => spacedPrint(obj, prefix_space: true);

void main() {
  // TODO: use List.from with jsonDecode to down-cast a List, see source code for example
  // List.from

  //   - takes an Iterable as an argument and converts it to a List
  //   - can be used to down-cast a List

  final jsonArray = '''
[{"name": "Gaara", "power": "sand", "clan": "sand ninja"},
 {"name": "Shikamaru", "power": "shadows", "clan": "leaf ninja"}]
''';

  final decoded_json = jsonDecode(jsonArray);

  prefixedSpacePrint('Decoded json data: $decoded_json');
}
