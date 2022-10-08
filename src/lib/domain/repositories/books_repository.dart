import 'package:AlphaReader/domain/entities/book.dart';

abstract class IBooksRepository {
  Future<Map<String, IBook>> getBooks();
  Future<Map<String, IBook>> addBook(IBook book);
}
