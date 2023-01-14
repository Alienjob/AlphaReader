import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';
import 'package:alpha_reader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:alpha_reader/features/book_list/widgets/fb2_file_picker.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedAppBar({super.key, required this.state});

  final BookListState state;

  @override
  Widget build(BuildContext context) {
    final String title = (state is BookListLoaded)
        ? (state as BookListLoaded).title
        : (state as BookListSwich).title;
    final double opacity = (state is BookListLoaded) ? 1 : 0;
    return AppBar(
      title: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 500),
        child: Text(title),
      ),
      actions: <Widget>[
        const FB2FilePicker(),
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

  @override
  Size get preferredSize => AppBar().preferredSize;
}
