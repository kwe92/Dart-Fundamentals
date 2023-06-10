import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchError implements Exception {
  const FetchError(this._message);
  final _message;

  @override
  String toString() => _message;
}

typedef QuoteRecord = ({
  String author,
  String quote,
  int characterCount,
});

QuoteRecord parseQuote(Map<String, dynamic> json) => (
      author: json["a"],
      quote: json["q"],
      characterCount: int.parse(json["c"]),
    );

void _responsePredicate(response) =>
    response.statusCode != 200 ? throw FetchError("Status Code: ${response.statusCode} | Unable to fetch data.") : null;

Future<QuoteRecord?> useQuotes() async {
  const baseUrl = 'https://zenquotes.io/api/quotes';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);
  _responsePredicate(response);
  return parseQuote(jsonDecode(response.body)[0]);
}

Future<void> main() async {
  final result = await useQuotes();
  print(result);
//   var (
//     author,
//     quote,
//   ) = result;
}
