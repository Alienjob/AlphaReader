part of 'book_list_bloc.dart';

@immutable
abstract class BookListEvent extends Equatable {}

class BookListEventStartApp implements BookListEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class BookListEventChangeBook implements BookListEvent {
  @override
  List<Object?> get props => [bookIndex];

  @override
  bool? get stringify => false;

  final int bookIndex;

  BookListEventChangeBook({
    required this.bookIndex,
  });
}

class BookListEventOpenBook implements BookListEvent {
  @override
  List<Object?> get props => [bookKey];

  @override
  bool? get stringify => false;

  final String bookKey;

  BookListEventOpenBook({
    required this.bookKey,
  });
}

class BookListEventAddFB2Book implements BookListEvent {
  @override
  List<Object?> get props => [path];

  @override
  bool? get stringify => false;

  final String path;

  BookListEventAddFB2Book({
    required this.path,
  });
}

class BookListEventRemoveFB2Book implements BookListEvent {
  @override
  List<Object?> get props => [book];

  @override
  bool? get stringify => false;

  final FB2Book book;

  BookListEventRemoveFB2Book({
    required this.book,
  });
}
