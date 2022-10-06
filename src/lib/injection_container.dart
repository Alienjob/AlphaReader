import 'package:AlphaReader/domain/repositories/books_repository.dart';
import 'package:AlphaReader/domain/usecases/change_sub.dart';
import 'package:AlphaReader/domain/usecases/get_books.dart';
import 'package:AlphaReader/domain/usecases/open_book.dart';
import 'package:AlphaReader/domain/usecases/select_page.dart';
import 'package:AlphaReader/features/book_list/data/datasources/book_source.dart';
import 'package:AlphaReader/features/book_list/data/repositories/books_repository_impl.dart';
import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:AlphaReader/features/core/data/user_data_repository.dart';
import 'package:AlphaReader/features/reader/data/reader_repository.dart';
import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! BLOC
  sl.registerLazySingleton<BookListBloc>(() => BookListBloc(
        getBooks: sl(),
        openBook: sl(),
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

  //! DATA SOURCE
  sl.registerLazySingleton<BookSourceEmbedded>(() => BookSourceEmbedded());
  sl.registerLazySingleton<BooksRepository>(
      () => BooksRepositoryImpl(bookSources: [sl.get<BookSourceEmbedded>()]));

  sl.registerLazySingleton<IReaderRepository>(
      () => ReaderRepository(bookSources: [sl.get<BookSourceEmbedded>()]));

  sl.registerLazySingleton<IUserDataRepository>(
      () => UserDataRepository(sharedPreferences: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
