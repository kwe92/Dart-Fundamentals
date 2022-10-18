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

Future<int> fetchInt() {
  return Future.value(999);
}

void main(List<String> args) async {
  print(await fetchInt());
  print('kidBuu@dbz.net'.split('').reversed);
}
