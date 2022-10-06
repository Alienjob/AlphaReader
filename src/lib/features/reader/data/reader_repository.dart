import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/features/book_list/data/datasources/book_source.dart';

abstract class IReaderRepository {
  Future<IBook> getBook(String key);
}

class ReaderRepository implements IReaderRepository {
  List<IBookSource> bookSources;
  ReaderRepository({required this.bookSources});

  @override
  Future<IBook> getBook(String bookKey) async {
    for (var source in bookSources) {
      var sourceBooks = await source.bookList();
      for (var book in sourceBooks.books) {
        if (book.key == bookKey) {
          return book;
        }
      }
    }
    throw Exception();
  }
}
