import 'dart:io';
import 'package:http/http.dart' as http;
import '../../working_with_local_endpoints/services/api_service.dart';

// TODO: handle when request fails, ping multiple times

class AniMemeService extends ApiService {
  @override
  String get host => "https://vast-puce-mite-fez.cyclic.app";

  @override
  Map<String, String> get headers => {HttpHeaders.contentTypeHeader: "application/json"};

  Future<http.Response> getMeme() async {
    return await get("/animeme");
  }
}
