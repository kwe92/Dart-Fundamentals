import 'dart:io';

import 'package:http/http.dart' as http;

/// fake http client that mimics returning a response from a remote server
class FakeHttpClient {
  /// mock http get request
  Future<http.Response> get(Uri url) async {
    await Future.delayed(const Duration(seconds: 1));

    if (url.pathSegments.first == 'ninja') {
      const filePath = 'lessons/json_serialization/decoding/shared/single_object.json';

      final jsonString = await _retrieveJson(filePath);

      return http.Response(jsonString, 200);
    } else if (url.pathSegments.first == 'ninjas') {
      const filePath = 'lessons/json_serialization/decoding/shared/array_of_data.json';

      final jsonArray = await _retrieveJson(filePath);
      return http.Response(jsonArray, 200);
    }

    return http.Response('{"error":"the requested endpoint does not exist."}', 404);
  }

  void close() => print('client closed.');
}

Future<String> _retrieveJson(String filePath) async {
  final file = File(filePath);

  try {
    final jsonString = await file.readAsString();

    return jsonString;
  } catch (err, st) {
    print('Error: ${err.toString()}');
    print(st);
    return '';
  }
}
