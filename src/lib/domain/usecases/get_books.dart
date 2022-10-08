import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/features/book_list/data/repositories/books_repository.dart';

class GetBooks {
  final BooksRepository repository;

  GetBooks({required this.repository});

  Future<Map<String, IBook>> call() async {
    return await repository.getBooks();
  }
}
