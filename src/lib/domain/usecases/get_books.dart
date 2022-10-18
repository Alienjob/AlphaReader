import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/entities/book_list.dart';
import 'package:alpha_reader/domain/repositories/books_repository.dart';
import 'package:alpha_reader/features/core/data/user_data_repository.dart';

class GetBooks {
  final IUserDataRepository userRepository;
  final IBooksRepository repository;

  GetBooks({required this.userRepository, required this.repository});

  Future<BookList> call() async {
    final String bookKey = await userRepository.book();
    final List<IBook> books = (await repository.getBooks()).values.toList();
    final int current =
        books.indexOf(books.firstWhere((element) => (element.key == bookKey)));
    return BookList(books: books, current: current);
  }
}
