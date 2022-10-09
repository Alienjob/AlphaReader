import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/domain/entities/book_list.dart';
import 'package:AlphaReader/domain/usecases/add_fb2_book.dart';
import 'package:AlphaReader/domain/usecases/get_books.dart';
import 'package:AlphaReader/domain/usecases/open_book.dart';
import 'package:AlphaReader/injection_container.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:AlphaReader/alpha_image_cache.dart';
import 'package:flutter/material.dart' as m;

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  // use cases
  final GetBooks getBooks;
  final OpenBook openBook;
  final AddFB2Book addFB2Book;

  // constructor

  BookListBloc({
    required this.getBooks,
    required this.openBook,
    required this.addFB2Book,
  }) : super(BookListInitial()) {
    on<BookListEventStartApp>(_onBookListEventStartApp);
    on<BookListEventChangeBook>(_onBookListEventChangeBook);
    on<BookListEventOpenBook>(_onBookListEventOpenBook);
    on<BookListEventAddFB2Book>(_onBookListEventAddFB2Book);
  }

  // events managers

  void _onBookListEventStartApp(
    BookListEventStartApp event,
    Emitter<BookListState> emit,
  ) async {
    emit(BookListLoading());
    var bookMap = await getBooks();
    List<IBook> books = bookMap.values.toList();
    emit(BookListLoaded(
      books: BookList(books),
      bookIndex: 0,
    ));
  }

  void _onBookListEventChangeBook(
    BookListEventChangeBook event,
    Emitter<BookListState> emit,
  ) async {
    emit(BookListSwich(
      books: (state as BookListLoaded).books,
      oldBookIndex: (state as BookListLoaded).bookIndex,
      bookIndex: event.bookIndex,
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    if (state is BookListLoaded) {
      emit(BookListLoaded(
        books: (state as BookListLoaded).books,
        bookIndex: event.bookIndex,
      ));
    } else {
      var bookMap = await getBooks();
      List<IBook> books = bookMap.values.toList();
      emit(BookListLoaded(
        books: BookList(books),
        bookIndex: event.bookIndex,
      ));
    }
  }

  void _onBookListEventOpenBook(
    BookListEventOpenBook event,
    Emitter<BookListState> emit,
  ) async {
    openBook(event.bookKey);
  }

  void _onBookListEventAddFB2Book(
    BookListEventAddFB2Book event,
    Emitter<BookListState> emit,
  ) async {
    emit(BookListLoading());
    Map<String, IBook> bookMap = await addFB2Book(event.path);

    List<IBook> books = bookMap.values.toList();
    emit(BookListLoaded(
      books: BookList(books),
      bookIndex: bookMap.keys.toList().indexOf(
            event.path,
          ),
    ));
  }
}
