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

  String get key {
    return books.books[bookIndex].key;
  }

  @override
  List<Object?> get props => [books, bookIndex];
}
