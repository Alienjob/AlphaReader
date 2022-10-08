import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/domain/repositories/books_repository.dart';

class GetBooks {
  final IBooksRepository repository;

  GetBooks({required this.repository});

  Future<Map<String, IBook>> call() async {
    return await repository.getBooks();
  }
}
