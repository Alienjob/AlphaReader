import '/domain/entities/book.dart';
import '/domain/entities/book_list.dart';
import '/domain/repositories/books_repository.dart';
import '/features/core/data/user_data_repository.dart';

class GetBooks {
  final IUserDataRepository userRepository;
  final IBooksRepository repository;

  GetBooks({required this.userRepository, required this.repository});

  Future<BookList> call() async {
    final String bookKey = await userRepository.book();
    final List<IBook> books = (await repository.getBooks()).values.toList();

    final IBook currentBook = books.firstWhere(
      (element) => (element.key == bookKey),
      orElse: () => books[0],
    );
    final int current = books.indexOf(currentBook);
    return BookList(books: books, current: current);
  }
}
