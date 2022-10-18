import 'package:alpha_reader/domain/entities/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class IBookList {
  final List<IBook> books = [];
  final int current = 0;
}

class BookList implements IBookList {
  @override
  final List<IBook> books;

  @override
  final int current;

  BookList({
    required this.books,
    required this.current,
  });

  String get key => books[current].key;
  String get title => books[current].title;
  String get description => books[current].description;
  Uint8List get imageData => books[current].imageData;
  Image get imageObject => books[current].imageObject;
  int get length => books[current].length;
  IBook get book => books[current];
}
