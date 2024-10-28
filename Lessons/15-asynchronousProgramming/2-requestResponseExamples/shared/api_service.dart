import 'http_service.dart';

// host should be hidden in .env | DotEnv dotenv | package:flutter_dotenv/src/dotenv.dart

abstract class ApiService with HttpServiceMixin {
  @override
  String get host;

  @override
  Map<String, String> get headers;
}

//   - this class is really only useful if you have multiple services
//     that use the same host and headers
