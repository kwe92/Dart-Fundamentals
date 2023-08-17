import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utility/spacedPrint.dart';

class TaskService {
  const TaskService._();

  // Todo: host should be hidden in .env | DotEnv dotenv | package:flutter_dotenv/src/dotenv.dart

  static const _host = "http://127.0.0.1:8082";

  static Future<List<dynamic>> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse(_host + endpoint),
      headers: headers,
    );

    final responseBody = response.body;

    final List<dynamic> data = jsonDecode(responseBody);

    return data;
  }
}

// Dart Enhanced Enum
enum EndPoint {
  gettasks("/gettasks"),

  gettask("/gettask/"),

  create("/create"),

  update("/update/"),

  delete("/delete/");

  final String path;

  const EndPoint(this.path);
}

Future<void> main() async {
  final data = await TaskService.get(
    EndPoint.gettasks.path,
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    },
  );

  spacedPrint(data, prefix_space: true);
}

// TODO: Review | Just review the whole package
// HttpHeaders.contentTypeHeader: "application/json"
// Dart Enhanced Enum
// headers
// hosts
// 
// 