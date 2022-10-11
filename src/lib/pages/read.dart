import 'package:AlphaReader/features/core/presentation/Loading.dart';
import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/reader_page_ui.dart';
import 'package:AlphaReader/injection_container.dart';

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
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: (() => sl<ReaderBloc>().add(
                            ReaderEventShowHideUI(),
                          )),
                      child: BlocBuilder<ReaderBloc, ReaderState>(
                        builder: (context, state) {
                          return (state is ReaderLoaded)
                              ? Html(
                                  data: state.pageText,
                                )
                              : Container();
                        },
                      ),
                    ),
                  ),
                ),
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
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return Scaffold(
      appBar: const ReaderAppBar(),
      body: _buildBody(context),
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
