// ignore_for_file: unused_catch_stack

import 'dart:convert';

import 'package:http/http.dart' as http;

// TODO: Comment your code with brevity!

mixin HttpService {
  static final _httpSocketError =
      http.Response('{"socket_exception":"Unable to communicate with server. Check your internet connection."}', 550);

  String get host;

  Map<String, String> get headers;

  Future<http.Response> get(
    String endpoint, {
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(tempHost ?? host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
      );

      return parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      print('Error:\n\n${error.toString()}');
      return _httpSocketError;
    }
  }

  Future<http.Response> post(
    String endpoint, {
    required dynamic body,
    String? tempHost,
    Map<String, String>? baseHeaders,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      print("headers: $headers");
      final http.Response response = await http.post(
        Uri.parse(tempHost ?? host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
        body: body,
      );
      return parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      print("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }
}

///  parseStatusCode logs endpoint, response status code and the server response.
http.Response parseStatusCode(http.Response response, String endpoint) {
  print('\nEndpoint: \n\n${endpoint}');
  print('\nStatus Code:\n\n${response.statusCode}');
  print('\nResponse Body:\n\n${utf8.decode(response.bodyBytes)}');

  return response;
}


























































































// TODO: Comment your code!

// What is a Service?

//   - Services aslo referred to as repositories request responses from
//     server endpoints
//   - the response is then decoded and servered throughout your application
//   - Services can also be used to serve temporary data throughtout your application
//     like a ToastService that displays temporary snack bars and banners
 
