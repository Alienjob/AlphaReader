import 'package:alpha_reader/domain/entities/book_list.dart';
import 'package:alpha_reader/features/admob/presentation/banner_tile.dart';
import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';
import 'package:alpha_reader/features/book_list/presentation/widgets/book_card.dart';
import 'package:alpha_reader/features/book_list/presentation/widgets/book_description.dart';
import 'package:alpha_reader/features/core/presentation/Loading.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:alpha_reader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowedExtensions: ['fb2', 'zip'],
    type: FileType.custom,
    lockParentWindow: true,
  );
  if (result == null) return null;
  if (result.files.first.extension != 'fb2' &&
      result.files.first.extension != 'zip') return null;

  /// path to the picked file
  String path = result.paths.first!;
  String pathOut = (await getApplicationDocumentsDirectory()).path;
  final bytes = File(result.files.first.path!).readAsBytesSync();

  /// encode zip
  if (result.files.first.extension == 'zip') {
    final archive = ZipDecoder().decodeBytes(bytes);
    File file = File(pathOut + archive.first.name)
      ..createSync()
      ..writeAsBytesSync(archive.first.content);
    path = file.path;
  } else {
    File file = File(pathOut + result.files.first.name)
      ..createSync()
      ..writeAsBytesSync(bytes);
    path = file.path;
  }

  return path;
}

PreferredSizeWidget _buildAppBar(BookListState state) {
  final String title = (state is BookListLoaded)
      ? (state.title)
      : (state as BookListSwich).title;
  final double opacity = (state is BookListLoaded) ? 1 : 0;
  return AppBar(
    title: AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      child: Text(title),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Open fb2 book',
        onPressed: () async {
          String? path = await pickFile();
          if (path == null) {
            print("pick file error");
          } else {
            sl<BookListBloc>().add(BookListEventAddFB2Book(path: path));
          }
        },
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        tooltip: 'Delete fb2 book',
        onPressed: () async {
          final current = (state as BookListLoaded).book;
          if (current is FB2Book) {
            sl<BookListBloc>().add(BookListEventRemoveFB2Book(book: current));
          }
        },
      ),
    ],
  );
}

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    Substitutions sub = Substitutions();

    return BlocBuilder<BookListBloc, BookListState>(
      builder: (context, state) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        if (state is BookListInitial) {
          sl<BookListBloc>().add(BookListEventStartApp());
        }
        return Scaffold(
          appBar: ((state is BookListLoaded) || (state is BookListSwich))
              ? _buildAppBar(state)
              : (const LoadingAppBar()),
          body: Container(
            child: (state is BookListInitial)
                ? const Center(child: CircularProgressIndicator())
                : (state is BookListLoading)
                    ? const Center(child: CircularProgressIndicator())
                    : ((state is BookListLoaded) || (state is BookListSwich))
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              _buildBookList(context, sub, state),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Desription:',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Expanded(
                                  child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity:
                                          (state is BookListLoaded) ? 1 : 0,
                                      child: BookDescription(
                                          description: (state is BookListLoaded)
                                              ? (state.description)
                                              : (state as BookListSwich)
                                                  .description))),
                              const SizedBox(
                                height: 16,
                              ),
                              const BannerTile(),
                            ],
                          )
                        : const Center(child: Text('????????????')),
          ),
        );
      },
    );
  }

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    sl<BookListBloc>().add(BookListEventChangeBook(bookIndex: index));
  }

  Widget _buildBookList(
      BuildContext context, Substitutions sub, BookListState state) {
    final BookList bookList = (state is BookListLoaded)
        ? (state.bookList)
        : (state as BookListSwich).bookList;
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        onPageChanged: onPageChange,
        initialPage: bookList.current,
      ),
      items: [
        ...(bookList.books.map((e) => BookCard(
              image: e.imageObject,
              bookKey: e.key,
            ))),
      ],
    );
  }
}
