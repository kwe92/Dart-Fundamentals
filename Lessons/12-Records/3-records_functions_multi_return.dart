// ignore_for_file: unused_local_variable, unused_import

// Functional Dart

import 'dart:convert';

Future<void> main() async {
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
  BookModel book;

  try {
    final responseJson = await fetchBook();

    book = BookModel.fromJSON(jsonDecode(responseJson));

    return (book, '');
  } catch (error) {
    return (BookModel(author: '', title: '', op: '', about: ''), error.toString());
  }
}

Future<String> fetchBook() async {
  await Future.delayed(Duration(seconds: 1));
  return bookJSON;
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

  factory BookModel.fromJSON(Map<String, dynamic> json) => BookModel(
        author: json["author"],
        title: json["title"],
        op: json["op"],
        about: json["about"],
      );

  @override
  String toString() => "Book(title: $title, author: $author)";
}
