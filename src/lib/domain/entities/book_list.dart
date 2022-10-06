import 'package:AlphaReader/domain/entities/book.dart';

abstract class IBookList {
  final List<IBook> books = [];
}

class BookList implements IBookList {
  @override
  final List<IBook> books;

  BookList(this.books);
}
