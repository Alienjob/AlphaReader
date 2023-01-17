import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/repositories/books_repository.dart';
import 'package:alpha_reader/features/book_list/data/embedded/books/embedded_book.dart';
import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';

class RemoveBook {
  final IBooksRepository repository;

  RemoveBook({required this.repository});

  void call(IBook book) async {
    if (book is EmbeddedBook) return;
    final fBook = book as FB2Book;

    repository.removeBook(fBook);
  }
}
