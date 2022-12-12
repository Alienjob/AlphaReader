import 'package:alpha_reader/features/core/presentation/Loading.dart';
import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/presentation/widgets/reader_page_ui.dart';
import 'package:alpha_reader/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ReadPage extends StatelessWidget {
  ReadPage({super.key});

  GlobalKey htmlAncor = GlobalKey();

  Widget _buildBody(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 100) {
                  sl<ReaderBloc>().add(
                    ReaderEventPreviousPage(),
                  );
                } else if (details.velocity.pixelsPerSecond.dx < -100) {
                  sl<ReaderBloc>().add(
                    ReaderEventNextPage(),
                  );
                }
              },
              child: ReaderBody(htmlAncor: htmlAncor),
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: GestureDetector(
            //         behavior: HitTestBehavior.translucent,
            //         onTap: (() {
            //           sl<ReaderBloc>().add(
            //             ReaderEventPreviousPage(),
            //           );
            //         }),
            //         child: Container(),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 4,
            //       child: GestureDetector(
            //         behavior: HitTestBehavior.translucent,
            //         onTap: (() {
            //           sl<ReaderBloc>().add(
            //             ReaderEventShowHideUI(),
            //           );
            //         }),
            //         child: Container(),
            //       ),
            //     ),
            //     Expanded(
            //       child: GestureDetector(
            //         behavior: HitTestBehavior.translucent,
            //         onTap: (() {
            //           sl<ReaderBloc>().add(
            //             ReaderEventNextPage(),
            //           );
            //         }),
            //         child: Container(),
            //       ),
            //     ),
            //   ],
            // ),
            ...([const ReadPageUI()]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReaderAppBar(),
      body: _buildBody(context),
      //  floatingActionButton:
      //      ScrollToBookmarkFloatingButton(htmlAncor: htmlAncor),
    );
  }
}

class ScrollToBookmarkFloatingButton extends StatelessWidget {
  const ScrollToBookmarkFloatingButton({
    Key? key,
    required this.htmlAncor,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> htmlAncor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.find_in_page),
      onPressed: () {
        final AnchorKey? htmlAncorKey = AnchorKey.forId(
          htmlAncor,
          (sl<ReaderBloc>().state as ReaderLoaded).bookmark,
        );
        if (htmlAncorKey == null) return;

        final BuildContext? anchorContext = htmlAncorKey.currentContext;
        if (anchorContext == null) return;

        Scrollable.ensureVisible(anchorContext);
      },
    );
  }
}

class ReaderBody extends StatelessWidget {
  const ReaderBody({
    Key? key,
    required this.htmlAncor,
  }) : super(key: key);
  final GlobalKey htmlAncor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderBloc, ReaderState>(
      builder: (context, state) {
        return (state is ReaderLoaded)
            ? SingleChildScrollView(
                child: Html(
                  anchorKey: htmlAncor,
                  onAnchorTap: (ancor, htmlContext, map, el) {
                    // scrollIntoView  final data = htmlContext.parser;
                    String id = map['id'] ?? 'empty';
                    sl<ReaderBloc>().add(ReaderEventSetBookmark(id));
                  },
                  style: {
                    "a": Style(
                        fontSize: state.fontSize,
                        fontFamily: state.font.family,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        textDecoration: TextDecoration.none),
                    '#${state.bookmark}': Style(
                        fontSize: state.fontSize,
                        fontFamily: state.font.family,
                        color: Theme.of(context).focusColor,
                        textDecoration: TextDecoration.none),
                  },
                  data: state.pageText,
                ),
              )
            : Container();
      },
    );
  }
}

class ReaderAppBar extends StatelessWidget with PreferredSizeWidget {
  const ReaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderBloc, ReaderState>(builder: (context, state) {
      if (state is ReaderLoaded) {
        return AppBar(
          title: Text(
            state.title,
          ),
          actions: [
            IconButton(
              onPressed: () {
                sl<ReaderBloc>().add(ReaderEventShowHideUI());
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        );
      } else {
        return const LoadingAppBar();
      }
    });
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
