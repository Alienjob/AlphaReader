import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/features/book_list/data/embedded/books/little_prince/ibook.dart';
import 'package:AlphaReader/features/book_list/data/embedded/books/the_causal_angel/ibook.dart';
import 'package:AlphaReader/features/book_list/data/models/book_list_model.dart';

abstract class IBookSource {
  Future<BookListModel> bookList();
}

class BookSourceEmbedded implements IBookSource {
  @override
  Future<BookListModel> bookList() {
    List<IBook> books = [];
    books.add(LittlePrinceBook());
    books.add(TheCausalAngelBook());

    BookListModel result = BookListModel(books);

    return Future.value(result);
  }
}
