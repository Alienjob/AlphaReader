import '/domain/entities/book.dart';
import '/domain/repositories/books_repository.dart';
import '/features/book_list/data/embedded/books/embedded_book.dart';
import '/features/book_list/data/fb2/fb2_book.dart';

class RemoveBook {
  final IBooksRepository repository;

  RemoveBook({required this.repository});

  void call(IBook book) async {
    if (book is EmbeddedBook) return;
    final fBook = book as FB2Book;

    repository.removeBook(fBook);
  }
}
