import 'package:AlphaReader/features/book_list/presentation/widgets/book_card.dart';
import 'package:AlphaReader/features/book_list/presentation/widgets/book_description.dart';
import 'package:AlphaReader/injection_container.dart';
import 'package:AlphaReader/domain/entities/substitutions.dart';
import 'package:flutter/material.dart';
import 'package:AlphaReader/features/book_list/data/embedded/books/books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_bloc.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EmbeddedBooks embedded = EmbeddedBooks();
    List<int> savedPageIndex = [];
    for (int i = 0; i < embedded.books.length; i++) {
      savedPageIndex.add(0);
    }

    Substitutions sub = Substitutions();

    return BlocBuilder<BookListBloc, BookListState>(
      builder: (context, state) {
        if (state is BookListInitial) {
          sl<BookListBloc>().add(BookListEventStartApp());
        }
        return Scaffold(
          appBar: AppBar(
              title: (state is BookListInitial)
                  ? const Text('Загрузка')
                  : (state is BookListLoading)
                      ? const Text('Загрузка...')
                      : (state is BookListLoaded)
                          ? Text(state.title)
                          : const Text(
                              ('Ошибка'),
                            )),
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
                              _buildBookList(
                                  context, sub, savedPageIndex, state),
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

  Widget _buildBookList(BuildContext context, Substitutions sub,
      List<int> savedPageIndex, BookListLoaded state) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        onPageChanged: onPageChange,
      ),
      items: [
        ...(state.books.books.map((e) => BookCard(
              imagePath: e.imagePath,
              bookKey: e.key,
            )))
      ],
    );
  }
}
