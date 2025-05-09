import '/features/book_list/presentation/bloc/book_list_bloc.dart';
import '/features/book_list/presentation/bloc/book_list_observer.dart';
import '/features/reader/application/bloc/reader_bloc.dart';
import '/injection_container.dart' as di;
import '/theme.dart';
import 'package:flutter/material.dart';
import '/pages/books.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:worker_manager/worker_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Executor().warmUp(log: true);
  await di.init();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = BookListObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookListBloc>(
            create: (BuildContext context) => di.sl<BookListBloc>()),
        BlocProvider<ReaderBloc>(
            create: (BuildContext context) => di.sl<ReaderBloc>()),
      ],
      child: MaterialApp(
        title: 'AlphaReader',
        themeMode: ThemeMode.dark,
        theme: LiquidTheme().darkSchemeData(),
        darkTheme: LiquidTheme().darkSchemeData(),
        home: const BooksPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
