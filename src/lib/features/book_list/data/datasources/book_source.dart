import 'dart:convert';

import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/features/book_list/data/embedded/books/little_prince.dart';
import 'package:alpha_reader/features/book_list/data/embedded/books/the_causal_angel.dart';
import 'package:alpha_reader/features/book_list/data/embedded/books/the_seven_madmen_book.dart';
import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';
import 'package:alpha_reader/features/book_list/data/models/book_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IBookSource {
  Future<BookListModel> bookList();
}

class BookSourceEmbedded implements IBookSource {
  final List<IBook> _books;
  BookSourceEmbedded._(List<IBook> books) : _books = books;

  static Future<BookSourceEmbedded> init() async {
    List<IBook> books = [];
    books.add(await TheSevenMadmenBook.init());
    books.add(await LittlePrinceBook.init());
    books.add(await TheCausalAngelBook.init());

    return BookSourceEmbedded._(books);
  }

  @override
  Future<BookListModel> bookList() {
    BookListModel result = BookListModel(books: _books, current: 0);
    return Future.value(result);
  }
}

class BookSourceFB2 implements IBookSource {
  final SharedPreferences sharedPreferences;
  final List<IBook> _books;

  BookSourceFB2._({
    required List<IBook> books,
    required this.sharedPreferences,
  }) : _books = books;

  static Future<BookSourceFB2> init(
      {required SharedPreferences sharedPreferences}) async {
    List<IBook> books = [];

    //List<String> savedBookData = [];
    List<String> savedBookData =
        sharedPreferences.getStringList('FB2_BOOKS') ?? [];
    for (var stringData in savedBookData) {
      Map<String, dynamic> data = json.decode(stringData);
      try {
        final book = await FB2Book.ofPath(path: data['path']);
        books.add(book);
      } catch (_) {
        savedBookData.remove(stringData);
      }
      sharedPreferences.setStringList(
        'FB2_BOOKS',
        savedBookData,
      );
    }

    return BookSourceFB2._(books: books, sharedPreferences: sharedPreferences);
  }

  @override
  Future<BookListModel> bookList() async {
    BookListModel result = BookListModel(
      books: _books,
      current: 0,
    );
    return Future.value(result);
  }

  Future<void> addBook({required String path}) async {
    List<String> savedBookData =
        sharedPreferences.getStringList('FB2_BOOKS') ?? [];
    savedBookData.add(json.encode({'path': path}));
    savedBookData = savedBookData.toSet().toList();
    await sharedPreferences.setStringList('FB2_BOOKS', savedBookData);

    _books.clear();
    for (var stringData in savedBookData) {
      Map<String, dynamic> data = json.decode(stringData);
      FB2Book newBook = await FB2Book.ofPath(path: data['path']);
      _books.add(newBook);
    }
  }
}
