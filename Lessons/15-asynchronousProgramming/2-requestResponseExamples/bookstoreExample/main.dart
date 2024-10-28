import '../shared/http_service.dart';
import 'models/book.dart';
import 'repository/book_repository.dart';

Future<void> main() async {
  await bookRepository.getBooks();

  print('books loaded: ${bookRepository.books}');

  final book1 = Book(title: 'Red Wings', author: 'Pierce Brown');

  final book2 = Book(title: 'Siddhartha', author: 'Hermann Hesse');

  await bookRepository.addBookToStore(book1);

  await bookRepository.addBookToStore(book2);

  print('added books: ${bookRepository.books}');

  // close client connection to terminate the program, else it will keep running as the docs say:

  //   -It's important to close each client when it's done being used; failing to do so can cause the Dart process to hang
  HttpClient.instance.close();
}
