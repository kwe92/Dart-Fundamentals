void main() {
  print("BookRecord: ");
  print(parseBook(bookJSON));

  print("BookModel: ");
  print(BookModel.fromJSON(bookJSON));
}

typedef BookRecord = ({
  String author,
  String title,
  int op,
  String about,
});

BookRecord parseBook(Map<String, dynamic> json) => (
      author: json["author"],
      title: json["title"],
      op: json["op"],
      about: json["about"],
    );

class BookModel {
  final String author;
  final String title;
  final int op;
  final String about;

  const BookModel({
    required this.author,
    required this.title,
    required this.op,
    required this.about,
  });

  factory BookModel.fromJSON(Map<String, dynamic> json) => BookModel(
        author: json['author'],
        title: json['title'],
        op: json['op'],
        about: json['about'],
      );

  @override
  String toString() => 'BookModel(author: $author,title: $title,op: $op,about: $about,)';
}

const Map<String, dynamic> bookJSON = {
  "author": "Shunryū Suzuki",
  "title": "Zen Mind, Beginner's Mind",
  "op": 1970,
  "about":
      "Zen Mind, Beginner's Mind is a book of teachings by Shunryu Suzuki, a compilation of talks given to his satellite Zen center in Los Altos, California.",
};
