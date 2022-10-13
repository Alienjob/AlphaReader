import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/presentation/widgets/reader_sublist.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderUIBottomPanel extends StatelessWidget {
  const ReaderUIBottomPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderBloc, ReaderState>(
      builder: (context, state) {
        return (state is ReaderLoaded)
            ? ReaderSubList(
                state: state,
              )
            : Container();
      },
    );
  }
}
