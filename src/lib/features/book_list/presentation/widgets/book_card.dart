import 'package:AlphaReader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:AlphaReader/features/book_list/presentation/widgets/inner_shadow.dart';
import 'package:AlphaReader/injection_container.dart';
import 'package:AlphaReader/pages/read.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.imageData,
    required this.bookKey,
  }) : super(key: key);

  final Uint8List imageData;
  final String bookKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: GestureDetector(
          onTap: () {
            sl<BookListBloc>().add(BookListEventOpenBook(
              bookKey: bookKey,
            ));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReadPage(),
              ),
            );
          },
          child: Stack(
            children: [
              InnerShadow(
                blur: 14,
                color: Colors.black,
                child: Image.memory(imageData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
