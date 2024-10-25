import 'models/quote.dart';
import 'services/quotes_service.dart';

Future<void> main() async {
  try {
    var quoteList = [];

    final quotesData = await quotesService.fetchQuotes();

    for (var i = 0; i < quotesData.length; i++) {
      quoteList.add(Quote.fromMap(quotesData[i]));
    }
    print(quoteList);
  } catch (err, _) {
    print('Error: ${err.toString()}');
  }
}
