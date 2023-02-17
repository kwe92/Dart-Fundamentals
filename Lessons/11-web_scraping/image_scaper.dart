import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchImages {
  const FetchImages();
  static const _uri = 'https://unsplash.com/s/photos/anime';

  static Future<void> getImages() async {
    final url = Uri.parse(_uri);
    final response = await http.get(url);
    final responseBody = response.body;
    print(responseBody);
  }
}

void main(List<String> args) {
  print(FetchImages.getImages());
}
