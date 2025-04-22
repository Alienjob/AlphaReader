import '/domain/entities/book.dart';

abstract class IBooksRepository {
  Future<Map<String, IBook>> getBooks();
  Future<Map<String, IBook>> addBook(IBook book);
  Future<void> removeBook(IBook book);
}
