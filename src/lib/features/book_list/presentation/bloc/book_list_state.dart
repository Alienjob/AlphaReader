part of 'book_list_bloc.dart';

@immutable
abstract class BookListState extends Equatable {}

class BookListInitial extends BookListState {
  @override
  List<Object?> get props => [];
}

class BookListLoading extends BookListState {
  @override
  List<Object?> get props => [];
}

class BookListLoaded extends BookListState {
  final BookList books;
  final int bookIndex;
  BookListLoaded({
    required this.books,
    required this.bookIndex,
  });

  String get title {
    return books.books[bookIndex].title;
  }

  String get description {
    return books.books[bookIndex].description;
  }

  Uint8List get imageData {
    return books.books[bookIndex].imageData;
  }

  m.Image get imageObject {
    var cache = sl<AlphaImageCache>();
    var key = books.books[bookIndex].key;
    var img = cache.get(key: key);
    if (img == null) {
      img = m.Image.memory(imageData);
      cache.add(key: key, value: img);
    }

    return img;
  }

  String get key {
    return books.books[bookIndex].key;
  }

  @override
  List<Object?> get props => [books, bookIndex];
}

class BookListSwich extends BookListState {
  final BookList books;
  final int bookIndex;
  final int oldBookIndex;

  BookListSwich({
    required this.books,
    required this.bookIndex,
    required this.oldBookIndex,
  });

  String get title {
    return books.books[oldBookIndex].title;
  }

  String get description {
    return books.books[oldBookIndex].description;
  }

  Uint8List get imageData {
    return books.books[bookIndex].imageData;
  }

  m.Image get imageObject {
    var cache = sl<AlphaImageCache>();
    var key = books.books[bookIndex].key;
    var img = cache.get(key: key);
    if (img == null) {
      cache.addUint8List(key: key, value: imageData);
      img = cache.get(key: key);
    }

    return img!;
  }

  String get key {
    return books.books[bookIndex].key;
  }

  @override
  List<Object?> get props => [books, bookIndex];
}
