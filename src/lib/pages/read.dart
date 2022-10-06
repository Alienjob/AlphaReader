import 'package:AlphaReader/features/core/presentation/Loading.dart';
import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/domain/entities/substitutions.dart';
import 'package:AlphaReader/features/reader/presentation/widgets/page_slider.dart';
import 'package:AlphaReader/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter/services.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  Widget _buildSubList(BuildContext context, Substitutions substitutions) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
      ),
      child: GridView.count(crossAxisCount: 6, children: [
        ...(substitutions.pairs.map((sub) => SizedBox(
            height: 50,
            child: GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (sub.active)
                      ? Theme.of(context).focusColor
                      : Theme.of(context).dialogBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    style: (sub.active)
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (Theme.of(context).highlightColor),
                          )
                        : const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                    "${sub.from} ${sub.to}",
                  ),
                ),
              ),
              onTap: () {
                sl<ReaderBloc>().add(ReaderEventOnOffSubstitution(
                  substitution: sub,
                ));
              },
            ))))
      ]),
    );
  }

  Widget _buildUI(BuildContext context, state) {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageSlider(
              pageCount: state.pageCount,
              pageIndex: state.pageIndex,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 420,
          child: _buildSubList(context, state.sub),
        ),
      ],
    );
  }

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
                      child: Text(
                        style: Theme.of(context).textTheme.bodyMedium,
                        state.pageText,
                      ),
                    ),
                  ),
                ),
              ),
              ...((state.showUI) ? [_buildUI(context, state)] : []),
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
