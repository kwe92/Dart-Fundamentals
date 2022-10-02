//'https://animechan.vercel.app/api/quotes/anime?title=naruto'

import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeChanApiClient {
  AnimeChanApiClient._();
  static void fetchData(String title) async {
    final uri = 'https://animechan.vercel.app/api/quotes/anime?title=${title}';
    final Uri url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          '$title may not be an available title to get quotes from.');
    }
    final responseObject = jsonDecode(response.body);
    for (Map<String, Object?> element in responseObject) {
      print("""
Anime: ${element['anime']}

${element['quote']}

      -${element['character']}

""");
    }
  }
}

int main(List<String> args) {
  final title = args.join(' ');
  AnimeChanApiClient.fetchData(title);
  return 0;
}
