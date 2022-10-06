import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  ApiClient();
  static const uri = 'https://animechan.vercel.app/api/random';
  static Future<void> fetchQuote() async {
    final Uri url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Cant connect: Status Code: ${response.statusCode}");
    }
    final responseObject = jsonDecode(response.body);
    print(responseObject);
  }
}

void main(List<String> args) {
  ApiClient.fetchQuote();
}
