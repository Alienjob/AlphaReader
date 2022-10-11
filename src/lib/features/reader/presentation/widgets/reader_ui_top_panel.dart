import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/page_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderUITopPanel extends StatelessWidget {
  const ReaderUITopPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderBloc, ReaderState>(
      builder: (context, state) {
        return (state is ReaderLoaded)
            ? SingleChildScrollView(
                reverse: true,
                child: SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Container(
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
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
