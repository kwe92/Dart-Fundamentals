// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;

Future<void> main() async {
  const _baseUrl0 = "http://localhost:8082/gettasks";

  const _baseUrl1 = "http://127.0.0.1:8082/gettasks";

  final url = Uri.parse(_baseUrl1);

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(
    "Status Code: ${response.statusCode}\n\nResponse data:\n\n${response.body}",
  );
}

// TODO: Comment your code!
