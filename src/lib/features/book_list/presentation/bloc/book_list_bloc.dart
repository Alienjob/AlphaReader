import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/entities/book_list.dart';
import 'package:alpha_reader/domain/usecases/add_fb2_book.dart';
import 'package:alpha_reader/domain/usecases/get_books.dart';
import 'package:alpha_reader/domain/usecases/open_book.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:alpha_reader/alpha_image_cache.dart';
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
    var bookList = await getBooks();
    emit(BookListLoaded(
      bookList: bookList,
    ));
  }

  void _onBookListEventChangeBook(
    BookListEventChangeBook event,
    Emitter<BookListState> emit,
  ) async {
    assert(state is BookListLoaded);
    BookListLoaded castState = (state as BookListLoaded);

    emit(
      BookListSwich(
        bookList: BookList(
          books: castState.bookList.books,
          current: event.bookIndex,
        ),
        oldBookIndex: castState.bookList.current,
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));

    emit(BookListLoaded(
      bookList: BookList(
        books: castState.bookList.books,
        current: event.bookIndex,
      ),
    ));
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
    final Map<String, IBook> bookMap = await addFB2Book(event.path);

    final List<IBook> books = bookMap.values.toList();
    final int bookIndex = books.indexOf(
      books.firstWhere((element) => element.key == event.path),
    );
    BookList bookList = BookList(books: books, current: bookIndex);

    emit(BookListLoaded(
      bookList: bookList,
    ));
  }
}
