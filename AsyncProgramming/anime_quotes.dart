import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeQuote {
  AnimeQuote({this.anime, this.quote});
  var anime;
  var quote;

  @override
  String toString() => "Anime: $anime\n" "Quote: $quote";

  Future<void> fetchQuotes() async {
    final url = Uri.parse("https://animechan.vercel.app/api/random");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Error in getting quote data.");
    }
    final responseJSON = jsonDecode(response.body);
    anime = responseJSON["anime"];
    quote = responseJSON["quote"];
  }
}

Future<int> main() async {
  var quoteList = [];
  for (var i = 0; i < 5; i++) {
    final AnimeQuote aniQuote = AnimeQuote();
    await aniQuote.fetchQuotes();
    quoteList.add(aniQuote);
  }
  quoteList.forEach((element) => print(element));
  return 0;
}
