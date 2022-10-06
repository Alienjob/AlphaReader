import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_observer.dart';
import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/injection_container.dart' as di;
import 'package:AlphaReader/theme.dart';
import 'package:flutter/material.dart';
import 'package:AlphaReader/pages/books.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = BookListObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);

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
      ),
    );
  }
}
