// 'https://animechan.vercel.app/api/quotes/anime?title=naruto'
// https://animechan.vercel.app/api/random

import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeChanApiClient {
  AnimeChanApiClient._();
  static void fetchData(String title) async {
    final String uri =
        'https://animechan.vercel.app/api/quotes/anime?title=${title}';
    final Uri url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "$title may not be an anime the endpoint has. Try another title.");
    }
    final responseObject = jsonDecode(response.body);
    print(responseObject);
    for (var animeQuoteObject in responseObject) {
      print("""

Anime: ${animeQuoteObject['anime']}

${animeQuoteObject['quote']}

    - ${animeQuoteObject['character']}

""");
    }
  }
}

int main(List<String> args) {
  final String title = args.join(' ');
  print(title);
  AnimeChanApiClient.fetchData(title);
  return 0;
}
