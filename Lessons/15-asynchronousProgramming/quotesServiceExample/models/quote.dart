import 'dart:convert';

class Quote {
  final String author;

  final String quote;

  const Quote({
    required this.author,
    required this.quote,
  });

  Map<String, dynamic> toMap() => {
        'a': author,
        'q': quote,
      };

  Quote.fromMap(Map<String, dynamic> map)
      : author = map['a'] ?? '',
        quote = map['q'] ?? '';

  String toJson() => jsonEncode(this.toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(jsonDecode(source));

  @override
  String toString() => 'Quote(author: $author, quote: $quote)';
}
