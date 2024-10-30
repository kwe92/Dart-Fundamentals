import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utility/prefixed_space_print.dart';
import 'fake_http_client.dart';

FakeNinjaApiService get fakeNinjaApiService => FakeNinjaApiService.instance;

class FakeNinjaApiService {
  static final instance = FakeNinjaApiService._();

  static final _fakeHttpClient = FakeHttpClient();

  FakeNinjaApiService._() {
    print('FakeNinjaApiService instance created');
  }

  Future<Map<String, Object?>> fetchNinja() async {
    final myNinjaEndpoint = 'http://www.ninjasquad.io/ninja';

    try {
      final response = _logResponseStatus(await _fakeHttpClient.get(Uri.parse(myNinjaEndpoint)), myNinjaEndpoint);

      final result = jsonDecode(response.body) as Map<String, Object?>;

      return result;
    } catch (err, _) {
      print('Error: ${err.toString()}');
      return {};
    }
  }

  Future<List<Map<String, Object?>>> fetchNinjas() async {
    final myNinjasEndpoint = 'http://www.ninjasquad.io/ninjas';

    try {
      final response = _logResponseStatus(await _fakeHttpClient.get(Uri.parse(myNinjasEndpoint)), myNinjasEndpoint);

      final result = (jsonDecode(response.body) as List).cast<Map<String, Object?>>();

      return result;
    } catch (err, stackTrace) {
      print('Error: ${err.toString()}');
      print(stackTrace.toString());
      return [];
    }
  }

  void closeClient() {
    _fakeHttpClient.close();
  }
}

http.Response _logResponseStatus(http.Response response, String endpoint) {
  final statusCode = response.statusCode;

  final responseBody = utf8.decode(response.bodyBytes);

  prefixedSpacePrint('Endpoint: $endpoint');

  prefixedSpacePrint('Status code: $statusCode');

  prefixedSpacePrint('Response body: $responseBody');

  return response;
}
