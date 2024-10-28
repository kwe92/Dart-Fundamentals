import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../shared/http_service.dart';

BookstoreService get bookstoreService => BookstoreService.instance;

class BookstoreService with HttpServiceMixin {
  BookstoreService._();

  static final _singleton = BookstoreService._();

  static final instance = _singleton;

  @override
  String get host => 'http://127.0.0.1:8080';

  @override
  Map<String, String> get headers => {HttpHeaders.contentTypeHeader: "application/json"};

  Future<http.Response> fetchBooks() async {
    final response = await get(BookstoreEndpoint.books.path);

    if (response.statusCode == 200) {
      return response;
    }

    throw 'error:\nstatus code: ${response.statusCode}\nerror message: ${response.body}';
  }

  Future<void> addBook(Map<String, dynamic> data) async {
    final response = await post(BookstoreEndpoint.book.path, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return;
    }

    throw 'error:\nstatus code: ${response.statusCode}\nerror message: ${response.body}';
  }

  Future<void> findBookByTitle(String title) async {
    final response = await get(BookstoreEndpoint.bookWithTitle.path + title);

    if (response.statusCode == 200) {
      return;
    }

    throw 'error:\nstatus code: ${response.statusCode}\nerror message: ${response.body}';
  }
}

enum BookstoreEndpoint {
  books('/books'),

  book('/book'),

  bookWithTitle('/book/bytitle/');

  final String path;

  const BookstoreEndpoint(this.path);
}
