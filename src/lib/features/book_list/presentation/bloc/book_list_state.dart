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
  final BookList bookList;
  BookListLoaded({
    required this.bookList,
  });

  String get title {
    return bookList.title;
  }

  String get description {
    return bookList.description;
  }

  Uint8List get imageData {
    return bookList.imageData;
  }

  m.Image get imageObject {
    var cache = sl<AlphaImageCache>();
    var key = bookList.key;
    var img = cache.get(key: key);
    if (img == null) {
      img = m.Image.memory(imageData);
      cache.add(key: key, value: img);
    }

    return img;
  }

  String get key {
    return bookList.key;
  }

  IBook get book {
    return bookList.book;
  }

  @override
  List<Object?> get props => [bookList];
}

class BookListSwich extends BookListState {
  final BookList bookList;
  final int oldBookIndex;

  BookListSwich({
    required this.bookList,
    required this.oldBookIndex,
  });

  String get title {
    return bookList.books[oldBookIndex].title;
  }

  String get description {
    return bookList.books[oldBookIndex].description;
  }

  Uint8List get imageData {
    return bookList.imageData;
  }

  m.Image get imageObject {
    var cache = sl<AlphaImageCache>();
    var key = bookList.key;
    var img = cache.get(key: key);
    if (img == null) {
      cache.addUint8List(key: key, value: imageData);
      img = cache.get(key: key);
    }

    return img!;
  }

  String get key {
    return bookList.key;
  }

  @override
  List<Object?> get props => [bookList, oldBookIndex];
}
