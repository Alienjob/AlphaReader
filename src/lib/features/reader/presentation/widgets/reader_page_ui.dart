import 'package:alpha_reader/features/reader/application/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/presentation/widgets/reader_ui_bottom_panel.dart';
import 'package:alpha_reader/features/reader/presentation/widgets/reader_ui_top_panel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadPageUI extends StatefulWidget {
  const ReadPageUI({
    super.key,
  });

  @override
  State<ReadPageUI> createState() => _ReadPageUIState();
}

class _ReadPageUIState extends State<ReadPageUI> {
  bool showUI = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReaderBloc, ReaderState>(
      listener: (context, state) {
        var newShowUI = (state is ReaderLoaded) ? (state.showUI) : false;
        if (newShowUI != showUI) {
          setState(() {
            showUI = newShowUI;
          });
        }
      },
      child: Column(
        children: [
          AnimatedContainer(
            height: showUI ? 145 : 0,
            duration: const Duration(milliseconds: 300),
            child: const ReaderUITopPanel(),
          ),
          const Spacer(),
          AnimatedContainer(
            height: showUI ? 420 : 0,
            duration: const Duration(milliseconds: 300),
            child: const ReaderUIBottomPanel(),
          ),
        ],
      ),
    );
  }
}
