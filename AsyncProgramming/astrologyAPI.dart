import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

var userid = "";
var apikey = "";
var data = {
  "day": 12,
  "month": 3,
  "year": 1992,
  "hour": 2,
  "min": 23,
  "lat": 19.132,
  "lon": 72.342,
  "tzone": 5.5
};

Codec<String, String> stringToBase64 = utf8.fuse(base64);
String encoded = stringToBase64.encode(userid + ":" + apikey);

Map<String, String> requestHeaders = {
  //'Accept': 'astro/app',
  "Content-Type": 'application/json',
  'authorization': "Basic " + userid + ":" + apikey,
  //'Userid': '620670'
};

Future<void> fetchQuotes() async {
  final url = Uri.parse("https://json.astrologyapi.com/v1/birth_details");
  final response =
      await http.post(url, headers: requestHeaders, body: jsonEncode(data));
  if (response.statusCode != 200) {
    throw Exception("Error in getting quote data.");
  }
  final responseJSON = jsonDecode(response.body);
  print(responseJSON);
}

Future<int> main() async {
  print(encoded);
  await fetchQuotes();
  /*


  var quoteList = [];
  for (var i = 0; i < 5; i++) {
    final AnimeQuote aniQuote = AnimeQuote();
    await aniQuote.fetchQuotes();
    quoteList.add(aniQuote);
  }
  quoteList.forEach((element) => print(element));

*/
  return 0;
}
