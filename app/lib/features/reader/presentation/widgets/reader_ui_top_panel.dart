import '/domain/entities/substitutions.dart';
import '/features/reader/application/bloc/reader_bloc.dart';
import '/features/reader/presentation/widgets/page_slider.dart';

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
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PageSlider(
                          setLabel:
                              (state.set == SubstitutionSet.en) ? 'EN' : 'RU',
                          pageCount: state.pageCount,
                          pageIndex: state.pageIndex,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
