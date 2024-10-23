import 'dart:convert';

import 'package:http/http.dart';

Future<void> main() async {
  // destructuring assignment
  var (book, error) = await getBook();

  if (error.isNotEmpty) {
    print(error);
    return;
  }

  print(book);
}

final bookJSON = jsonEncode({
  "author": "Shunryū Suzuki",
  "title": "Zen Mind, Beginner's Mind",
  "op": "1970",
  "about":
      "Zen Mind, Beginner's Mind is a book of teachings by Shunryu Suzuki, a compilation of talks given to his satellite Zen center in Los Altos, California.",
});

Future<(BookModel book, String error)> getBook() async {
  var book = BookModel(author: '', title: '', op: '', about: '');

  try {
    final response = await fetchBook();

    if (response.statusCode == 200) {
      book = BookModel.fromJSON(jsonDecode(response.body));
      return (book, '');
    }
    return (book, 'Error: status code: ${response.statusCode}');
  } catch (error) {
    return (book, error.toString());
  }
}

Future<Response> fetchBook() async {
  await Future.delayed(Duration(seconds: 1));

  return Response(bookJSON, 200);
}

class BookModel {
  final String author;

  final String title;

  final String op;

  final String about;

  const BookModel({
    required this.author,
    required this.title,
    required this.op,
    required this.about,
  });

  BookModel.fromJSON(Map<String, dynamic> json)
      : author = json["author"],
        title = json["title"],
        op = json["op"],
        about = json["about"];

  @override
  String toString() => 'BookModel(author: $author, title: $title, op: $op, about: $about)';
}

// Multiple returns

//   - records allow functions to return multiple values bundled together in a type safe way

//   - values from a record returned by a function can be destructured into local
//     variables by using pattern matching

//   - you do not have to assign all of the values returned by a record
//     to local variables, to omit any record values you do not wish to bind
//     when destructuring us the wildcard _ in place of a local variables