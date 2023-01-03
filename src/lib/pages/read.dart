import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/presentation/widgets/reader_page_ui.dart';
import 'package:alpha_reader/features/reader/widgets/reader_app_bar.dart';
import 'package:alpha_reader/features/reader/widgets/reader_body.dart';
import 'package:alpha_reader/injection_container.dart';

import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  ReadPage({super.key});

  final GlobalKey htmlAncor = GlobalKey();

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
