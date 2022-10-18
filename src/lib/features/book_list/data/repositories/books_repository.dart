import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/repositories/books_repository.dart';
import 'package:alpha_reader/domain/usecases/remove_book.dart';
import 'package:alpha_reader/features/book_list/data/datasources/book_source.dart';
import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';

class BooksRepository implements IBooksRepository {
  final BookSourceEmbedded bookSourceEmbedded;
  final BookSourceFB2 bookSourceFB2;

  BooksRepository({
    required this.bookSourceEmbedded,
    required this.bookSourceFB2,
  });

  @override
  Future<Map<String, IBook>> getBooks() async {
    Map<String, IBook> result = {};

    var embeddedBooks = await bookSourceEmbedded.bookList();
    var fb2Books = await bookSourceFB2.bookList();

    for (var book in embeddedBooks.books) {
      result[book.key] = book;
    }
    for (var book in fb2Books.books) {
      result[book.key] = book;
    }

    return result;
  }

  @override
  Future<Map<String, IBook>> addBook(IBook book) async {
    if (book is FB2Book) {
      await bookSourceFB2.addBook(path: book.key);
    } else {
      throw UnimplementedError();
    }

    return await getBooks();
  }

  @override
  Future<void> removeBook(IBook book) async {
    await bookSourceFB2.removeBook(path: book.key);
  }
}
