import 'package:AlphaReader/features/book_list/data/embedded/books/embedded_book.dart';
import 'package:AlphaReader/features/book_list/data/embedded/books/little_prince/book.dart';
import 'package:AlphaReader/features/book_list/data/embedded/books/the_causal_angel/book.dart';

class EmbeddedBooks {
  List<EmbeddedBook> books = [
    LittlePrinceBook(),
    TheCausalAngelBook(),
  ];
}
