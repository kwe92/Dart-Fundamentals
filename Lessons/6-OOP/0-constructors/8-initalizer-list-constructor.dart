class BiblicalQuote {
  final String verseID, book, author, quote;

  // named constructor with initializer list
  BiblicalQuote.fromJSON(Map<String, dynamic> json)
      : verseID = json['verse_id'],
        book = json['book'],
        author = json['author'],
        quote = json['quote'] {
    // constructor body after the initalizer list
    print('constructor body after the initalizer list: $this');
  }

  @override
  String toString() => 'BiblicalQuote(verseID: $verseID, book: $book, author: $author, quote: $quote)';
}

class BiblicalQuote2 {
  // how you would handle the initialization of final fields that are
  // dependent on data from a Map without an Initializer List using the 'late' modifier
  late final String verseID, book, author, quote;

  BiblicalQuote2.fromJSON(Map<String, dynamic> json) {
    verseID = json['verse_id'];
    book = json['book'];
    author = json['author'];
    quote = json['quote'];
  }

  @override
  String toString() => 'BiblicalQuote(verseID: $verseID, book: $book, author: $author, quote: $quote)';
}

Future<void> main() async {
  final result = await useFetchQuoteAPI();

  final biblicalQuote0 = BiblicalQuote.fromJSON(result);

  final biblicalQuote1 = BiblicalQuote2.fromJSON(result);

  print('\nRandom Bible Verse: $biblicalQuote0\n');

  print('\nRandom Bible Verse: $biblicalQuote1\n');

  try {
    // late variable has implicit setter and will fail at rumtime
    // instead of compile-time
    biblicalQuote1.author = 'Peter';

    // with an Initializer List variables can remain final without an implicit setter
    // and will be initialized before the constructor body

    // biblicalQuote0.author = 'Peter';
  } catch (err, _) {
    print('ERROR: ${err.toString()}');
  }
}

Future<Map<String, dynamic>> useFetchQuoteAPI() async {
  await Future.delayed(Duration(seconds: 1));

  return {
    'verse_id': '1:8',
    'book': 'James',
    'author': 'James The Apostle',
    'quote': 'A double minded man is unstable in all his ways.',
  };
}

// Initalizer Lists

//   - initalize instance variables BEFORE the constructor body

//   - the right hand side of an initializer list does not have access to the 'this' keyword
//     as the fields are initialized before the instwance of the class is created

//   - can be used in place of initializing formal parameters to initialize final instance variables
//     or private instance variables

// Initalizer List Use Cases:

//   - dealing with API data and implementing a fromJSON method

//   - initalizing final variables that would otherwise need to be marked as late
//     and initialized in the constructor body, which is more verbose and implicitly adds
//     setters to final variables and the error of reassignment is caught at runtime instead of compile-time

//   - initalizing final variables where the argument is not a constant
//     i.e. a non-const constructor or a function invocation

//   - initializing private variables as named parameters
//     as private variables can not be used as named initializing formal parameters

//   - using assertions to validate input during development

