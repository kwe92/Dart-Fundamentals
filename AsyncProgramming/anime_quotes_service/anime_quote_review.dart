import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeChanApi {
  static const uri = 'https://animechan.vercel.app/api/random';

  static Future<void> fetchData() async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    final result = jsonDecode(response.body);
    print(result);
  }
}

int main(List<String> args) {
  AnimeChanApi.fetchData();
  return 0;
}
