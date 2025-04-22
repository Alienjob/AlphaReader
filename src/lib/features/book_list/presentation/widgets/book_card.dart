import '/features/book_list/presentation/bloc/book_list_bloc.dart';
import '/features/book_list/presentation/widgets/inner_shadow.dart';
import '/injection_container.dart';
import '/pages/read.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.image,
    required this.bookKey,
  }) : super(key: key);

  final Image image;
  final String bookKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: GestureDetector(
          onTap: () {
            sl<BookListBloc>().add(BookListEventOpenBook(
              bookKey: bookKey,
            ));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadPage(),
              ),
            );
          },
          child: Stack(
            children: [
              InnerShadow(
                blur: 14,
                color: Colors.black,
                child: image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
