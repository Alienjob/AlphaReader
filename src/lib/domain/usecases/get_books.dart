import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/domain/repositories/books_repository.dart';

class GetBooks {
  final BooksRepository repository;

  GetBooks({required this.repository});

  Future<List<IBook>> call() async {
    return await repository.getList();
  }
}
