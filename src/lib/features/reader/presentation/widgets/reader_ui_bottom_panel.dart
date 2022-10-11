import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/reader_sublist.dart';

import 'package:flutter/material.dart';

class ReaderUIBottomPanel extends StatelessWidget {
  const ReaderUIBottomPanel({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ReaderLoaded state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: ReaderSubList(
        state: state,
      ),
    );
  }
}
