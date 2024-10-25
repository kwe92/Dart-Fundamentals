import 'services/zen_quote_service.dart';

Future<void> main() async {
  final zenQuoteService = ZenQuoteService();

  final quote = await zenQuoteService.getZenQuote();

  print(quote);
}
