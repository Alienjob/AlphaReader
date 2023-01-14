import 'package:alpha_reader/domain/entities/book_list.dart';
import 'package:alpha_reader/features/admob/presentation/banner_tile.dart';
import 'package:alpha_reader/features/book_list/presentation/widgets/book_card.dart';
import 'package:alpha_reader/features/book_list/presentation/widgets/book_description.dart';
import 'package:alpha_reader/features/book_list/widgets/animated_app_bar.dart';
import 'package:alpha_reader/features/core/presentation/Loading.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:alpha_reader/features/book_list/presentation/bloc/book_list_bloc.dart';

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
              ? (AnimatedAppBar(state: state) as PreferredSizeWidget)
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
                                  'Description:',
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
