import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/domain/repositories/books_repository.dart';
import 'package:AlphaReader/features/book_list/data/datasources/book_source.dart';

class BooksRepositoryImpl implements BooksRepository {
  List<IBookSource> bookSources;

  BooksRepositoryImpl({required this.bookSources});

  @override
  Future<List<IBook>> getList() async {
    List<IBook> result = [];
    for (var source in bookSources) {
      var bookList = await source.bookList();
      for (var book in bookList.books) {
        result.add(book);
      }
    }
    return result;
  }
}
