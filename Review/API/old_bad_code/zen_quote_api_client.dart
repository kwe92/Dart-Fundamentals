// https://zenquotes.io/api/quotes

import 'package:http/http.dart' as http;
import 'dart:convert';

class ZenQuoteClient {
  static const uri = "https://zenquotes.io/api/quotes";

  Future<Quote> fetchQuote() async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Unable to fetch data");
    }
    final responseObject = jsonDecode(response.body) as List;
    final json = responseObject.first;
    return Quote.fromJSON(json);
  }
}

class Quote {
  const Quote({required this.author, required this.quote});
  final author;
  final quote;

  factory Quote.fromJSON(Map<String, Object?> json) =>
      Quote(author: json["a"], quote: json["q"]);

  @override
  String toString() => """

$quote

- $author

""";
}

Future<int> main() async {
  final api = ZenQuoteClient();
  final quote = await api.fetchQuote();
  print(quote);
  return 0;
}
