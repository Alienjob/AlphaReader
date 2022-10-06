import 'package:AlphaReader/domain/entities/book.dart';

abstract class BooksRepository {
  Future<List<IBook>> getList();
}
