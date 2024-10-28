// ignore_for_file: unused_catch_stack

import 'dart:convert';

import 'package:http/http.dart' as http;

final _client = http.Client();

/// HttpService abstracts away commonly repeated http method details.
mixin HttpService {
  static final _httpSocketError =
      http.Response('{"socket_exception":"Unable to communicate with server. Check your internet connection."}', 550);
  String get host;

  Map<String, String> get headers;

  /// HTTP GET request with the given headers to the given URL endpoint.
  Future<http.Response> get(
    String endpoint, {
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await _client.get(
        Uri.parse(tempHost ?? host + endpoint),
        headers: headers..addAll(extraHeaders ?? {}),
      );

      return parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      print('Error:\n\n${error.toString()}');
      return _httpSocketError;
    }
  }

  /// HTTP POST request with the given headers and body to the given URL.
  Future<http.Response> post(
    String endpoint, {
    required dynamic body,
    String? tempHost,
    Map<String, String>? baseHeaders,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await _client.post(
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

  /// HTTP PUT request with the passed in headers and body to the given URI.
  Future<http.Response> put(
    String endpoint, {
    required dynamic body,
    String? tempHost,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final http.Response response = await _client.put(
        Uri.parse(tempHost ?? host + endpoint),
        body: body,
        headers: headers..addAll(extraHeaders ?? {}),
      );
      return parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      print("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }

  /// HTTP DELETE request with the passed in headers to the specified URI.
  Future<http.Response> delete(String endpoint) async {
    try {
      final response = await _client.delete(
        Uri.parse(host + endpoint),
      );

      return parseStatusCode(response, host + endpoint);
    } catch (error, stackTrace) {
      print("Error:\n\n${error.toString()}");
      return _httpSocketError;
    }
  }
}

/// logs endpoint, response status code and the server response
http.Response parseStatusCode(http.Response response, String endpoint) {
  print('\nEndpoint: \n\n$endpoint');

  print('\nStatus Code:\n\n${response.statusCode}');

  print('\nResponse Body:\n\n${utf8.decode(response.bodyBytes)}');

  return response;
}

// Creating a Client For Multiple Requests

//   - methods part of the HTTP API are meant to make one off requests
//     and initialize a new [Client] and closes that client once the request is complete

//   - if you're making multiple requests to the same server
//     you should use a single [Client] for all of those requests

//   - ensure the client is closed once you are done using it

// What is a Service?

//   - Services aslo referred to as repositories request responses from
//     server endpoints

//   - the response is then decoded and servered throughout your application

//   - Services can also be used to serve temporary data throughtout your application
//     like a ToastService that displays temporary snack bars and banners
