import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/reader_ui_bottom_panel.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/reader_ui_top_panel.dart';

import 'package:flutter/material.dart';

class ReadPageUI extends StatelessWidget {
  const ReadPageUI({super.key, required this.state});

  final ReaderLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReaderUITopPanel(state: state),
        const Spacer(),
        ReaderUIBottomPanel(state: state),
      ],
    );
  }
}
