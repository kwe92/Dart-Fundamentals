import 'dart:convert';

import '../models/book.dart';
import '../services/bookstore_service.dart';

BookRepository get bookRepository => BookRepository.instance;

class BookRepository {
  BookRepository._();

  static final _singleton = BookRepository._();

  static final instance = _singleton;

  List<Book> _books = [];

  List<Book> get books => _books;

  Future<void> getBooks() async => await errorHandler(() async {
        final response = await bookstoreService.fetchBooks();

        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final List data = responseBody['data'];

        // List down-casting
        final result = List<Map<String, dynamic>>.from(data);

        _books = [for (var json in result) Book.fromJson(json)];
      });

  Future<void> addBookToStore(Book book) async => await errorHandler(() async {
        bookstoreService.addBook(book.toJson());
        _books.add(book);
      });

  Future<void> findBookByTitle(String title) async => await errorHandler(() => bookstoreService.findBookByTitle(title));
}

Future<void> errorHandler(Future<void> Function() callback) async {
  try {
    await callback.call();
  } catch (err, st) {
    print(err.toString());

    print(st.toString());
  }
}
