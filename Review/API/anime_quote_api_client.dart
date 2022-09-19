import 'dart:convert';
import 'package:http/http.dart' as http;

// https://animechan.vercel.app/api/random

class FetchError implements Exception {
  const FetchError(this._message);
  final _message;

  @override
  String toString() => _message;
}

class AnimeChanApiClient {
  static const baseUrl = "https://animechan.vercel.app/api/rando";
  Future<AnimeQuote> fetchQuote() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw FetchError(
          "Status Code: ${response.statusCode} | Unable to fetch data.");
    }
    final json = jsonDecode(response.body);
    return AnimeQuote.fromJSON(json);
  }
}

class AnimeQuote {
  const AnimeQuote({required this.anime, required this.quote});
  final anime;
  final quote;

  factory AnimeQuote.fromJSON(Map<String, Object?> json) =>
      AnimeQuote(anime: json["anime"], quote: json["quote"]);

  @override
  String toString() => """
Anime: 

$anime

Quote Text:

$quote
""";
}

Future<int> main() async {
  final AnimeChanApiClient api = AnimeChanApiClient();
  try {
    final AnimeQuote animeQuote = await api.fetchQuote();
    print(animeQuote);
  } catch (error) {
    print(error);
    return 1;
  }
  return 0;
}
