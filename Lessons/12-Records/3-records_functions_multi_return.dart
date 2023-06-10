// Functional Dart

const bookJSON = {
  "author": "Shunryū Suzuki",
  "title": "Zen Mind, Beginner's Mind",
  "op": "1970",
  "about":
      "Zen Mind, Beginner's Mind is a book of teachings by Shunryu Suzuki, a compilation of talks given to his satellite Zen center in Los Altos, California.",
};

typedef Book = ({String author, String title, String op, String about});

Book parseBookJSON(Map<String, dynamic> json) => (
      author: json["author"],
      title: json["title"],
      op: json["op"],
      about: json["about"],
    );
void main() {
  print("Parsed json object:");
  print(
    parseBookJSON(
      bookJSON,
    ),
  );

  final Book book1 = parseBookJSON(bookJSON);
}

// Old Way
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
}
