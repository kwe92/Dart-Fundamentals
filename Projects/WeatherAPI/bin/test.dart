// as keyword
//  - defines a dommon identifier to be used when calling functions inside of a package

import 'package:http/http.dart' as http;
import 'dart:convert';

/*

http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}

*/

var apikey = "";
Future<void> fetchData(String city) async {
  final baseURL = "http://api.openweathermap.org/geo/1.0";
  final locationURL = Uri.parse(
      "http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid=");
  final response = await http.post(locationURL);
  if (response.statusCode != 200) {
    print(response.statusCode);
    throw Exception("Unable to fetch data");
  }
  print(response);
  final responseBody = jsonDecode(response.body);
  print(responseBody);
}

Future<int> main() async {
  await fetchData("London");
  return 0;
}
