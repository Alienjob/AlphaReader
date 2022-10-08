import 'package:AlphaReader/domain/repositories/books_repository.dart';
import 'package:AlphaReader/domain/usecases/add_fb2_book.dart';
import 'package:AlphaReader/domain/usecases/change_sub.dart';
import 'package:AlphaReader/domain/usecases/choose_book.dart';
import 'package:AlphaReader/domain/usecases/get_books.dart';
import 'package:AlphaReader/domain/usecases/open_book.dart';
import 'package:AlphaReader/domain/usecases/select_page.dart';
import 'package:AlphaReader/features/book_list/data/datasources/book_source.dart';
import 'package:AlphaReader/features/book_list/data/repositories/books_repository.dart';
import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:AlphaReader/features/core/data/user_data_repository.dart';
import 'package:AlphaReader/features/reader/data/reader_repository.dart';
import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! SERVICE

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! DATA SOURCE

  //! DATA SOURCE - BOOK

  sl.registerLazySingleton<IBooksRepository>(() => BooksRepository(
        bookSourceEmbedded: sl(),
        bookSourceFB2: sl(),
      ));

  var bookSourceEmbedded = await BookSourceEmbedded.init();
  sl.registerLazySingleton<BookSourceEmbedded>(() => bookSourceEmbedded);

  var bookSourceFB2 = await BookSourceFB2.init(sharedPreferences: sl());
  sl.registerLazySingleton<BookSourceFB2>(() => bookSourceFB2);

  sl.registerLazySingleton<IReaderRepository>(
      () => ReaderRepository(booksRepository: sl()));

  //! DATA SOURCE - USER DATA

  sl.registerLazySingleton<IUserDataRepository>(
      () => UserDataRepository(sharedPreferences: sl()));

  //! BLOC
  sl.registerLazySingleton<BookListBloc>(() => BookListBloc(
        getBooks: sl(),
        openBook: sl(),
        addFB2Book: sl(),
      ));

  sl.registerLazySingleton<ReaderBloc>(() => ReaderBloc());

  //! USE CASES
  sl.registerLazySingleton<GetBooks>(() => GetBooks(
        repository: sl(),
      ));
  sl.registerLazySingleton<OpenBook>(() => OpenBook(
        repository: sl(),
        readerBloc: sl(),
      ));
  sl.registerLazySingleton<SelectPage>(() => SelectPage(
        repository: sl(),
      ));
  sl.registerLazySingleton<ChangeSub>(() => ChangeSub(
        repository: sl(),
      ));
  sl.registerLazySingleton<ChooseBook>(() => ChooseBook(
        repository: sl(),
      ));
  sl.registerLazySingleton<AddFB2Book>(() => AddFB2Book(
        bookRepository: sl(),
        userDatarepository: sl(),
      ));
}
