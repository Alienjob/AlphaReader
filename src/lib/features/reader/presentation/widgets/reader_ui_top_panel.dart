import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/page_slider.dart';

import 'package:flutter/material.dart';

class ReaderUITopPanel extends StatelessWidget {
  const ReaderUITopPanel({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ReaderLoaded state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageSlider(
          pageCount: state.pageCount,
          pageIndex: state.pageIndex,
        ),
      ),
    );
  }
}
