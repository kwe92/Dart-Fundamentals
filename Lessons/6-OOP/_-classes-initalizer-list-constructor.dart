// Initalizer Lists

//   - one of two types of named constructors
//   - initalize instance variables BEFORE the constructor body
//   - CAN NOT have a constructor body of its own
//   - implying that it can not handle complex logic
//   - MUST return an instance of its type

// Initalizer Lists are useful when:

//   - dealing with API data
//   - initalizing final variables
//     with simple logic involved
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
  final String verseID, book, author, quote;

  BiblicalQuote.fromJSON(Map<String, dynamic> json)
      : verseID = json['verseID'],
        book = json['book'],
        author = json['author'],
        quote = json['quote'];

  @override
  String toString() => 'BiblicalQuote(verseID: $verseID, book: $book, author: $author, quote: $quote)';
}

Future<void> main() async {
  final Map<String, dynamic> result = await useFetchQuoteAPI();
  final BiblicalQuote biblicalQuote = BiblicalQuote.fromJSON(
    result,
  );
  print('\nRandom Bible Verse: $biblicalQuote\n');
}
