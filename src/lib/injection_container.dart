import '/alpha_image_cache.dart';
import '/domain/repositories/books_repository.dart';
import '/domain/usecases/add_fb2_book.dart';
import '/domain/usecases/change_sub.dart';
import '/domain/usecases/choose_book.dart';
import '/domain/usecases/get_books.dart';
import '/domain/usecases/mix_done.dart';
import '/domain/usecases/open_book.dart';
import '/domain/usecases/remove_book.dart';
import '/domain/usecases/save_offset.dart';
import '/domain/usecases/select_page.dart';
import '/domain/usecases/set_book_mark.dart';
import '/features/admob/application/bloc/ad_mob_bloc.dart';
import '/features/book_list/data/datasources/book_source.dart';
import '/features/book_list/data/fb2/fb2_buffer.dart';
import '/features/book_list/data/repositories/books_repository.dart';
import '/features/book_list/presentation/bloc/book_list_bloc.dart';
import '/features/core/data/user_data_repository.dart';
import '/features/fonts/bloc/font_bloc.dart';
import '/features/fonts/repository.dart';
import '/features/purchase/bloc/shop_bloc.dart';
import '/features/purchase/purchase_repository.dart';
import '/features/reader/data/reader_repository.dart';
import '/features/reader/application/bloc/reader_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! SERVICE

  sl.registerSingleton<AlphaImageCache>(AlphaImageCache());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<FB2Buffer>(
      () => FB2Buffer(sharedPreferences: sharedPreferences));

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

  //! DATA SOURCE - FONT
  sl.registerLazySingleton<FontRepositary>(() => FontRepositary());

  //! DATA SOURCE - Store
  var revenueCatPurshaseRepository = RevenueCatPurshaseRepository();
  await revenueCatPurshaseRepository.init();
  sl.registerLazySingleton<IPurshaseRepository>(
      () => revenueCatPurshaseRepository);

  //! BLOC

  sl.registerFactory<AdMobBloc>(() => AdMobBloc(
        sl(),
      )..add(AdMobEventInit()));
  sl.registerFactory<ShopBloc>(() => ShopBloc(
        sl(),
      ));

  sl.registerLazySingleton<BookListBloc>(() => BookListBloc(
        getBooks: sl(),
        openBook: sl(),
        addFB2Book: sl(),
        removeBook: sl(),
      ));

  sl.registerLazySingleton<ReaderBloc>(() => ReaderBloc());

  sl.registerFactory<FontBloc>(() => FontBloc(sl(), sl()));

  //! USE CASES
  sl.registerLazySingleton<GetBooks>(() => GetBooks(
        userRepository: sl(),
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
  sl.registerLazySingleton<RemoveBook>(() => RemoveBook(
        repository: sl(),
      ));
  sl.registerLazySingleton<SetBookMark>(() => SetBookMark(
        repository: sl(),
      ));
  sl.registerLazySingleton<SaveOffset>(() => SaveOffset(
        repository: sl(),
      ));
  sl.registerLazySingleton<MixDone>(() => MixDone(
        repository: sl(),
      ));
}
