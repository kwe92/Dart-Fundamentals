// Named Constructor

// Initalizer Lists

//   - Initalize instance variables BEFORE the constructor body
//   - MUST return an instance of the class

// Initalizer Lists are useful when:

//   - dealing with API data
//   - initalizing final variables
//   - creating test robots (very advanced concept)

Future<Map<String, dynamic>> useFetchQuoteAPI() async {
  await Future.delayed(
    Duration(seconds: 1),
  );
  return {
    'verseID': '1:8',
    'book': 'James',
    'author': 'James The Apostle',
    'quote': 'A double minded man is unstable in all his ways.',
  };
}

class BiblicalQuote {
  String verseID, book, author, quote;

  BiblicalQuote.fromJSON(Map<String, dynamic> json)
      : verseID = json['verseID'],
        book = json['book'],
        author = json['author'],
        quote = json['quote'];

  @override
  String toString() => 'BiblicalQuote(verseID: $verseID, book: $book, author: $author, quote: $quote)';
}

Future<void> main() async {
  final BiblicalQuote biblicalQuote = BiblicalQuote.fromJSON(
    await useFetchQuoteAPI(),
  );
  print('Random Bible Verse: $biblicalQuote');
}
