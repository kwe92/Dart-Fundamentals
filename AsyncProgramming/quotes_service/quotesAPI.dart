import 'package:http/http.dart' as http;
import 'dart:convert';

class Quote {
  const Quote({required this.author, required this.quote});
  final author;
  final quote;

  @override
  String toString() => "Author: $author\n" "Quote: $quote";
}

Future<Object> fetchQuotes() async {
  final url = Uri.parse("https://zenquotes.io/api/quotes");
  final response = await http.get(url);
  // the server sending status code 200 means a successful response
  if (response.statusCode != 200) {
    // the calling code should catch this error if it is thrown
    throw Exception("Error in getting quote data.");
  }
  // response.body
  //    - the body of a response as a string
  final responseJSON = jsonDecode(response.body);
  return responseJSON;
}

Future<int> main() async {
  try {
    var quoteList = [];
    var randQuotes = await fetchQuotes() as List;
    // var quote = randQuotes[0];
    for (var i = 0; i < randQuotes.length; i++) {
      quoteList.add(Quote(author: randQuotes[0]["q"], quote: randQuotes[0]["a"]));
    }
    print(quoteList[3]);
    //print(quote["q"]);
  } catch (error) {
    print(error);
  }
  return 0;
}
