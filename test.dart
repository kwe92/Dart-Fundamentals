// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiClient {
//   ApiClient();
//   static const uri = 'https://animechan.vercel.app/api/random';
//   static Future<void> fetchQuote() async {
//     final Uri url = Uri.parse(uri);
//     final response = await http.get(url);
//     if (response.statusCode != 200) {
//       throw Exception("Cant connect: Status Code: ${response.statusCode}");
//     }
//     final responseObject = jsonDecode(response.body);
//     print(responseObject);
//   }
// }

// Future<int> fetchInt() {
//   return Future.value(999);
// }

// class Point {
//   Point(this.x, this.y);
//   int x;
//   int y;

//   int getX() => x;
// }

// void main(List<String> args) {
//   print(() => '');
//   print(Point(2, 4).getX);
// }

void main() {
  String myString = 'Kweayon';
  String myString2 = '';
  print(myString[myString.length - 1]);
  print(myString2[0]);
}
