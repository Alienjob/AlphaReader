import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/features/reader/widgets/reader_html_view.dart';
import 'package:alpha_reader/pages/read.dart';
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

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderBloc, ReaderState>(
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
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {});
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {});
    }
  }
}
