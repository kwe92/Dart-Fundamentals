import 'dart:io';
import 'http_service.dart';

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
