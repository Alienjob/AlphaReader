import 'package:AlphaReader/features/core/presentation/Loading.dart';
import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/reader_page_ui.dart';
import 'package:AlphaReader/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  Widget _buildLoadedBody(BuildContext context, ReaderLoaded state) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          child: Stack(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: (() =>
                          sl<ReaderBloc>().add(ReaderEventShowHideUI())),
                      child: Html(
                        data: state.pageText,
                      ),
                    ),
                  ),
                ),
              ),
              ...((state.showUI)
                  ? [
                      ReadPageUI(
                        state: state,
                      )
                    ]
                  : []),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ReaderState state) {
    switch (state.runtimeType) {
      case ReaderLoaded:
        return _buildLoadedBody(context, (state as ReaderLoaded));
      default:
        return const LoadingBody();
    }
  }

  PreferredSizeWidget _buildAppBar(ReaderState state) {
    switch (state.runtimeType) {
      case ReaderLoaded:
        return AppBar(
            title: Text(
          (state as ReaderLoaded).title,
        ));
      default:
        return const LoadingAppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return BlocBuilder<ReaderBloc, ReaderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(state),
          body: _buildBody(context, state),
        );
      },
    );
  }
}
