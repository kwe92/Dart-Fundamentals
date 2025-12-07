import 'package:http/http.dart' as http;

Future<void> main() async {
  try {
    final http.Response response = await http.get(Uri.parse("http://172.10.1.44:8080"));
    print(response.body);
  } catch (error, stackTrace) {
    print('Error:\n\n${error.toString()}');
  }
}
