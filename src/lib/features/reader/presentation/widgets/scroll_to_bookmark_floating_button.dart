import '/features/reader/application/bloc/reader_bloc.dart';
import '/injection_container.dart';
import 'package:flutter/material.dart';

class ScrollToBookmarkFloatingButton extends StatelessWidget {
  const ScrollToBookmarkFloatingButton({
    Key? key,
    required this.htmlAncor,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> htmlAncor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.find_in_page),
      onPressed: () {
        // final AnchorKey? htmlAncorKey = AnchorKey.forId(
        //   htmlAncor,
        //   (sl<ReaderBloc>().state as ReaderLoaded).bookmark,
        // );
        // if (htmlAncorKey == null) return;

        // final BuildContext? anchorContext = htmlAncorKey.currentContext;
        // if (anchorContext == null) return;

        // Scrollable.ensureVisible(anchorContext);
      },
    );
  }
}
