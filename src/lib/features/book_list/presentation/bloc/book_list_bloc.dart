import 'package:AlphaReader/domain/entities/book.dart';
import 'package:AlphaReader/domain/entities/book_list.dart';
import 'package:AlphaReader/domain/usecases/get_books.dart';
import 'package:AlphaReader/domain/usecases/open_book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  // use cases
  final GetBooks getBooks;
  final OpenBook openBook;

  // constructor

  BookListBloc({required this.getBooks, required this.openBook})
      : super(BookListInitial()) {
    on<BookListEventStartApp>(_onBookListEventStartApp);
    on<BookListEventChangeBook>(_onBookListEventChangeBook);
    on<BookListEventOpenBook>(_onBookListEventOpenBook);
  }

  // events managers

  void _onBookListEventStartApp(
    BookListEventStartApp event,
    Emitter<BookListState> emit,
  ) async {
    emit(BookListLoading());
    List<IBook> books = await getBooks();
    emit(BookListLoaded(books: BookList(books), bookIndex: 0));
  }

  void _onBookListEventChangeBook(
    BookListEventChangeBook event,
    Emitter<BookListState> emit,
  ) async {
    if (state is BookListLoaded) {
      emit(BookListLoaded(
          books: (state as BookListLoaded).books, bookIndex: event.bookIndex));
    } else {
      List<IBook> books = await getBooks();
      emit(BookListLoaded(books: BookList(books), bookIndex: event.bookIndex));
    }
  }

  void _onBookListEventOpenBook(
    BookListEventOpenBook event,
    Emitter<BookListState> emit,
  ) async {
    print('_onBookListEventOpenBook');
    openBook(event.bookKey);
  }
}
