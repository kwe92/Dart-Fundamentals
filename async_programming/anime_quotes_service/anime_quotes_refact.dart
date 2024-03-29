// ignore_for_file: unused_local_variable
// TODO: refactor to use HttpService and ApiService classes

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utility/spacedPrint.dart';

class FetchError implements Exception {
  const FetchError(this._message);
  final _message;

  @override
  String toString() => _message;
}

typedef QuoteRecord = (
  String author,
  String quote,
  int characterCount,
);

QuoteRecord parseQuote(Map<String, dynamic> json) => (
      json["a"],
      json["q"],
      int.parse(json["c"]),
    );

void _responsePredicate(response) =>
    response.statusCode != 200 ? throw FetchError("Status Code: ${response.statusCode} | Unable to fetch data.") : null;

Future<QuoteRecord> useQuotes() async {
  const baseUrl = 'https://zenquotes.io/api/quotes';
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);
  _responsePredicate(response);
  return parseQuote(jsonDecode(response.body)[0]);
}

Future<void> main() async {
  final result = await useQuotes();

  // similar to tuple unpacking in python
  final (author, quote, word_count) = result;

  final arr1 = [];

  spacedPrint(result, prefix_space: true);

  spacedPrint(quote);

  // const ({int x, int y}) p1 = (x: 4, y: 3);
  // var (i, j) = p1;
}
