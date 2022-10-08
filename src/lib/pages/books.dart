import 'package:AlphaReader/features/book_list/presentation/widgets/book_card.dart';
import 'package:AlphaReader/features/book_list/presentation/widgets/book_description.dart';
import 'package:AlphaReader/features/core/presentation/Loading.dart';
import 'package:AlphaReader/injection_container.dart';
import 'package:AlphaReader/domain/entities/substitutions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

PreferredSizeWidget _buildAppBar(BookListLoaded state) {
  return AppBar(
    title: Text(state.title),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Open fb2 book',
        onPressed: () async {
          var testPath =
              '/data/user/0/com.example.hello_world/cache/file_picker/impieriia-nie-viedavshaia-porazhienii-glien-charlz-kuk.fb2';
          sl<BookListBloc>().add(BookListEventAddFB2Book(path: testPath));

          /*
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            lockParentWindow: true,
          );
          if (result == null) return;
          if (result.files.first.extension != 'fb2' &&
              result.files.first.extension != 'zip') return;

          /// path to the picked file
          String path = result.paths.first!;

          /// encode zip
          if (result.files.first.extension == 'zip') {
            final bytes = File(result.files.first.path!).readAsBytesSync();
            final archive = ZipDecoder().decodeBytes(bytes);
            String pathOut = (await getApplicationDocumentsDirectory()).path;
            File file = File(pathOut + archive.first.name)
              ..createSync()
              ..writeAsBytesSync(archive.first.content);
            path = file.path;
          }

          sl<BookListBloc>().add(BookListEventAddFB2Book(path: path));

          */
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
        if (state is BookListInitial) {
          sl<BookListBloc>().add(BookListEventStartApp());
        }
        return Scaffold(
          appBar: (state is BookListLoaded)
              ? _buildAppBar(state)
              : (const LoadingAppBar()),
          body: Container(
            child: (state is BookListInitial)
                ? const Center(child: CircularProgressIndicator())
                : (state is BookListLoading)
                    ? const Center(child: CircularProgressIndicator())
                    : (state is BookListLoaded)
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              _buildBookList(context, sub, state),
                              BookDescription(description: state.description),
                            ],
                          )
                        : const Center(child: Text('Ошибка')),
          ),
        );
      },
    );
  }

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    sl<BookListBloc>().add(BookListEventChangeBook(bookIndex: index));
  }

  Widget _buildBookList(
      BuildContext context, Substitutions sub, BookListLoaded state) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        onPageChanged: onPageChange,
      ),
      items: [
        ...(state.books.books.map((e) => BookCard(
              imageData: e.imageData,
              bookKey: e.key,
            )))
      ],
    );
  }
}
