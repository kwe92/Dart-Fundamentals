// ignore_for_file: unused_catch_stack

import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utility/spacedPrint.dart';
import 'services/api_service.dart';

// TODO: refactor implementation to handle if the server is not reached | try catch error

// TODO: abstract into a HttpService mixin and then create an ApiService to inherit from

// Todo: host should be hidden in .env | DotEnv dotenv | package:flutter_dotenv/src/dotenv.dart

class TaskService {
  const TaskService._();

  static const String _host = "http://127.0.0.1:8082";

  static final http.Response httpSocketError = http.Response('[{"error": "there was an issue with requesting your data"}]', 550);

  static Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse(_host + endpoint),
        headers: headers,
      );
      return response;

      // final responseBody = response.body;

      // final List<dynamic> data = jsonDecode(responseBody);

      // return data;
    } catch (error, stackTrace) {
      print('Error:\n\n$error');
      final errorData = jsonDecode(httpSocketError.body);

      return httpSocketError;
      // return errorData;
    } finally {}
  }
}

// class TaskService extends ApiService {
//   Future<List<dynamic>> getAllTasks() async {
//     http.Response response = await get(EndPoint.gettasks.path);
//     return jsonDecode(response.body);
//   }
// }

Future<void> main() async {
  final response = await TaskService.get(EndPoint.gettasks.path);
  spacedPrint('Response: ${response.body}', prefix_space: true);
}

// TODO: Review | Just review the whole package
// HttpHeaders.contentTypeHeader: "application/json"
// Dart Enhanced Enum
// headers
// hosts
// json decoding and encoding
// 