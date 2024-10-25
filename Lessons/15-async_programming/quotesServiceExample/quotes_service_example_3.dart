// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../utility/spacedPrint.dart';

Future<void> main() async {
  try {
    final result = await useQuotes();

    for (var i = 0; i < result.length; i++) {
      var (author, quote, word_count) = result[i];

      spacedPrint(result, prefix_space: true);

      spacedPrint(quote);
    }
  } catch (err, _) {
    print('Error: ${err.toString()}');
  }
}

class FetchError implements Exception {
  final String _message;

  const FetchError(this._message);

  @override
  String toString() => _message;
}

typedef QuoteRecord = (
  String author,
  String quote,
  int characterCount,
);

QuoteRecord parseQuote(Map<String, dynamic> json) => (
      json['a'],
      json['q'],
      int.parse(json['c']),
    );

Future<List<QuoteRecord>> useQuotes() async {
  var quotes = <QuoteRecord>[];

  const baseUrl = 'https://zenquotes.io/api/quotes';

  final url = Uri.parse(baseUrl);

  final response = await http.get(url);

  _responseHandler(response);

  final quotesData = List<Map<String, Object?>>.from(jsonDecode(response.body));

  for (var i = 0; i < quotesData.length; i++) {
    quotes.add(parseQuote(quotesData[i]));
  }

  return quotes;
}

void _responseHandler(http.Response response) => response.statusCode != 200
    ? throw FetchError('Status Code: ${response.statusCode} | Unable to fetch data.' + '\n\n' + 'response body\n${response.body}')
    : null;
