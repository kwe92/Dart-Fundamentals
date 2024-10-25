import 'dart:convert';
import 'dart:io';

import '../../working_with_local_endpoints/services/api_service.dart';

class ZenQuoteService extends ApiService {
  @override
  String get host => "https://zenquotes.io";

  @override
  Map<String, String> get headers => {HttpHeaders.contentTypeHeader: "application/json"};

  Future<List<dynamic>> getZenQuote() async {
    final response = await get('/api/quotes');
    final quote = jsonDecode(response.body);
    return quote;
  }
}
