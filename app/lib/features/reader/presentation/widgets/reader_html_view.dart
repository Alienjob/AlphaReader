import '/features/reader/application/bloc/reader_bloc.dart';
import '/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ReaderHtmlView extends StatelessWidget {
  const ReaderHtmlView({
    Key? key,
    //required this.htmlAncor,
    required this.state,
  }) : super(key: key);

  //final GlobalKey<State<StatefulWidget>> htmlAncor;
  final ReaderLoaded state;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      state.pageText,
      //anchorKey: htmlAncor,
      // onAnchorTap: (ancor, htmlContext, map, el) {
      //   // scrollIntoView  final data = htmlContext.parser;
      //   String id = map['id'] ?? 'empty';
      //   sl<ReaderBloc>().add(ReaderEventSetBookmark(id));
      // },
      // style: {
      //   "a": Style(
      //       fontSize: state.fontSize,
      //       fontFamily: state.font.family,
      //       color: Theme.of(context).textTheme.bodyMedium!.color,
      //       textDecoration: TextDecoration.none),
      //   "em": Style(
      //       fontSize: state.fontSize,
      //       fontFamily: state.font.family,
      //       color: Theme.of(context).textTheme.bodyMedium!.color,
      //       textDecoration: TextDecoration.underline),
      //   "emphasis": Style(
      //       fontSize: state.fontSize,
      //       fontFamily: state.font.family,
      //       color: Theme.of(context).textTheme.bodyMedium!.color,
      //       textDecoration: TextDecoration.underline),
      //   '#${state.bookmark}': Style(
      //       fontSize: state.fontSize,
      //       fontFamily: state.font.family,
      //       color: Theme.of(context).focusColor,
      //       textDecoration: TextDecoration.none),
      // },
    );
  }
}
