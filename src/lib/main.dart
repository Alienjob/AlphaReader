import 'package:alpha_reader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:alpha_reader/features/book_list/presentation/bloc/book_list_observer.dart';
import 'package:alpha_reader/features/reader/application/bloc/reader_bloc.dart';
import 'package:alpha_reader/injection_container.dart' as di;
import 'package:alpha_reader/theme.dart';
import 'package:flutter/material.dart';
import 'package:alpha_reader/pages/books.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
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
