import "animeAPI.dart";

Future<int> main() async {
  List<AnimeQuote> ql = [];
  for (var i = 0; i < 3; i++) {
    AnimeQuote q = AnimeQuote();
    await q.fetchData();
    ql.add(q);
  }

  ql.forEach((element) {
    print("---------------");
    print(element.anime);
    print(element.quote);
    print("---------------");
  });
  return 0;
}
