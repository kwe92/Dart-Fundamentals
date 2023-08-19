import 'dart:io';
import 'http_service.dart';

// Todo: host should be hidden in .env | DotEnv dotenv | package:flutter_dotenv/src/dotenv.dart

abstract class ApiService with HttpService {
  @override
  String get host => "http://127.0.0.1:8082";

  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: "application/json",
      };
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

// TODO: Comment your code!

