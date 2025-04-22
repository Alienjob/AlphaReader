import '/features/reader/application/bloc/reader_bloc.dart';
import '/features/reader/presentation/widgets/reader_page_ui.dart';
import '/features/reader/presentation/widgets/reader_app_bar.dart';
import '/features/reader/presentation/widgets/reader_body.dart';
import '/injection_container.dart';

import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  ReadPage({super.key});

  final GlobalKey htmlAncor = GlobalKey();

  Widget _buildBody(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            //ReaderBody(htmlAncor: htmlAncor),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
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
