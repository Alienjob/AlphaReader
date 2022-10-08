import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/domain/repositories/books_repository.dart';
import 'package:AlphaReader/domain/usecases/choose_book.dart';
import 'package:AlphaReader/features/book_list/data/fb2/fb2_book.dart';
import 'package:AlphaReader/features/core/data/user_data_repository.dart';

class AddFB2Book {
  final IBooksRepository bookRepository;
  final IUserDataRepository userDatarepository;

  AddFB2Book({
    required this.bookRepository,
    required this.userDatarepository,
  });

  Future<Map<String, IBook>> call(String path) async {
    var book = await FB2Book.ofPath(path: path);
    var books = await bookRepository.addBook(book);

    return books;
  }
}
