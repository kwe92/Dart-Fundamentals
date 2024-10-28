import 'dart:convert';

import 'package:http/http.dart' as http;

QuotesService get quotesService => QuotesService();

class QuotesService {
  Future<List<Map<String, Object?>>> fetchQuotes() async {
    final url = Uri.parse("https://zenquotes.io/api/quotes");

    final response = await http.get(url);

    // the server sending status code 200 means a successful response
    if (response.statusCode != 200) {
      // the calling code should catch this error if it is thrown
      throw Exception("Error in getting quote data.");
    }
    // response.body

    //    - the body of a response as a string

    final List responseJSON = jsonDecode(response.body);

    final result = List<Map<String, Object?>>.from(responseJSON);

    return result;
  }
}
