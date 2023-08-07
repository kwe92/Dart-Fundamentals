import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../utility/spacedPrint.dart';

class _FetchError implements Exception {
  const _FetchError(this._message);
  final _message;

  @override
  String toString() => _message;
}

class MemeService {
  static final _baseUrl = 'https://vast-puce-mite-fez.cyclic.app/animeme';
  final Uri _url = Uri.parse(_baseUrl);

  Future<void> getMeme() async {
    try {
      final http.Response response = await http.get(_url);
      if (response.statusCode != 200) {
        throw _FetchError('\nStatus Code:\n\n${response.statusCode}\n\nThere was a problem fetching your data.');
      }
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      spacedPrint('responseBody:\n\n$responseBody\n\nrun time type: ${responseBody.runtimeType}', prefix_space: true);
    } catch (error, stackTrace) {
      spacedPrint('Error: $error', prefix_space: true);
    } finally {}
  }
}

Future<void> main() async {
  final MemeService memeService = MemeService();
  await memeService.getMeme();
}
