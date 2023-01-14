import 'package:alpha_reader/features/admob/presentation/banner_tile.dart';
import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/widgets/reader_html_view.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderBody extends StatefulWidget {
  const ReaderBody({
    Key? key,
    required this.htmlAncor,
  }) : super(key: key);
  final GlobalKey htmlAncor;

  @override
  State<ReaderBody> createState() => _ReaderBodyState();
}

class _ReaderBodyState extends State<ReaderBody> {
  late ScrollController _controller;
  late ReaderBloc _bloc;

  @override
  void initState() {
    double _initialOffset = 0;
    _bloc = sl<ReaderBloc>();
    if (_bloc.state is ReaderLoaded) {
      _initialOffset = (_bloc.state as ReaderLoaded).offset;
    }
    _controller = ScrollController(initialScrollOffset: _initialOffset);
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: BlocBuilder<ReaderBloc, ReaderState>(
            buildWhen: (previous, current) {
              if (current is! ReaderLoaded) return false;
              if (previous is! ReaderLoaded) return true;
              if ((current.pageText.hashCode == previous.pageText.hashCode) &&
                  (current.font == previous.font) &&
                  (current.fontSize == previous.fontSize)) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              return (state is ReaderLoaded)
                  ? SingleChildScrollView(
                      controller: _controller,
                      child: ReaderHtmlView(
                        htmlAncor: widget.htmlAncor,
                        state: state,
                      ),
                    )
                  : Container();
            },
          ),
        ),
        const BannerTile(),
      ],
    );
  }

  _scrollListener() {
    _bloc.add(ReaderEventSetOffset(_controller.offset));
  }
}
