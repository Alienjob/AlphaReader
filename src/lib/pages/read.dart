import 'package:alpha_reader/features/core/presentation/Loading.dart';
import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/presentation/widgets/reader_page_ui.dart';
import 'package:alpha_reader/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
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
                child: ReaderBody(),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        sl<ReaderBloc>().add(
                          ReaderEventPreviousPage(),
                        );
                      }),
                      child: Container(),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        sl<ReaderBloc>().add(
                          ReaderEventShowHideUI(),
                        );
                      }),
                      child: Container(),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        sl<ReaderBloc>().add(
                          ReaderEventNextPage(),
                        );
                      }),
                      child: Container(),
                    ),
                  ),
                ],
              ),
              ...([const ReadPageUI()]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReaderAppBar(),
      body: _buildBody(context),
    );
  }
}

class ReaderBody extends StatelessWidget {
  const ReaderBody({
    Key? key,
  }) : super(key: key);

  String _style(String html) {
    return '''
      <body>
          $html
      <body/>''';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ReaderBloc, ReaderState>(
        builder: (context, state) {
          return (state is ReaderLoaded)
              ? Html(
                  style: {
                    "body": Style(
                      padding: const EdgeInsets.all(8),
                      fontSize: state.fontSize,
                      fontFamily: state.font.family,
                      //fontFamily: "3DUnicode",
                    )
                  },
                  data: _style(state.pageText),
                )
              : Container();
        },
      ),
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
        ));
      } else {
        return const LoadingAppBar();
      }
    });
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
