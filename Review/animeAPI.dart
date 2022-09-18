import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeQuote {
  var _anime;
  var _quote;
  String get anime => _anime;
  String get quote => _quote;

  Future<void> fetchData() async {
    final url = Uri.parse("https://animechan.vercel.app/api/random");
    final response = await http.get(url);
    final responseData = jsonDecode(response.body);
    _anime = responseData["anime"];
    _quote = responseData["quote"];
    //print(responseData);
  }
}
