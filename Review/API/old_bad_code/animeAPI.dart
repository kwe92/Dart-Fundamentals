import 'package:http/http.dart' as http;
import 'dart:convert';

//TODO: this is a bad way to fetch data :(
class AnimeQuote {
  var _anime;
  var _quote;
  String get anime => _anime;
  String get quote => _quote;

  Future<void> fetchData() async {
    final url =
        Uri.parse("https://animechan.vercel.app/api/quotes/anime?title=naruto");
    final response = await http.get(url);
    final List responseData = jsonDecode(response.body);
    //_anime = responseData["anime"];
    // _quote = responseData["quote"];
    print(responseData.length);
  }
}

int main(List<String> args) {
  AnimeQuote().fetchData();
  return 0;
}
