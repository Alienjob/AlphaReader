import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/injection_container.dart';
import 'package:flutter/material.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({
    required this.pageIndex,
    required this.pageCount,
    Key? key,
  }) : super(key: key);

  final int pageIndex;
  final int pageCount;

  @override
  State<PageSlider> createState() =>
      // ignore: no_logic_in_create_state
      _PageSliderState(pageCount: pageCount, pageIndex: pageIndex);
}

class _PageSliderState extends State<PageSlider> {
  int pageIndex;
  int pageCount;

  _PageSliderState({required this.pageCount, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('page ${pageIndex + 1} / $pageCount'),
        Slider(
          divisions: pageCount,
          value: pageIndex.toDouble(),
          onChanged: ((value) {
            setState(() {
              pageIndex = value.toInt();
            });
          }),
          min: 0,
          max: pageCount.toDouble() - 1,
          onChangeEnd: ((value) {
            sl<ReaderBloc>().add(
              ReaderEventChoosePage(
                pageIndex: value.toInt(),
              ),
            );
          }),
        )
      ],
    );
  }
}
