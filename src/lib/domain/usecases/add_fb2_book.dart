import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/repositories/books_repository.dart';
import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';
import 'package:alpha_reader/features/core/data/user_data_repository.dart';

class AddFB2Book {
  final IBooksRepository bookRepository;
  final IUserDataRepository userDatarepository;

  AddFB2Book({
    required this.bookRepository,
    required this.userDatarepository,
  });

  Future<Map<String, IBook>> call(String path) async {
    try {
      var book = await FB2Book.ofPath(path: path);
      var books = await bookRepository.addBook(book);
      return books;
    } catch (e) {
      var books = await bookRepository.getBooks();
      return books;
    }
  }
}
