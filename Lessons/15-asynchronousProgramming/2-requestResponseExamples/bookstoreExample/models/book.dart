class Book {
  final String title;

  final String author;

  Book({required this.title, required this.author});

  @override
  String toString() => 'Book(title: $title, author: $author)';

  Book.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
      };
}
