import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/features/book_list/data/repositories/books_repository.dart';

abstract class IReaderRepository {
  Future<IBook> getBook(String key);
}

class ReaderRepository implements IReaderRepository {
  BooksRepository booksRepository;

  ReaderRepository({required this.booksRepository});

  @override
  Future<IBook> getBook(String bookKey) async {
    var books = await booksRepository.getBooks();
    var result = books[bookKey];
    if (result != null) {
      return result;
    }

    throw Exception();
  }
}
