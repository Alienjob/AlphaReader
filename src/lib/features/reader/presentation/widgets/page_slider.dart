import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:alpha_reader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:alpha_reader/pages/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({
    required this.pageIndex,
    required this.pageCount,
    required this.setLabel,
    Key? key,
  }) : super(key: key);

  final int pageIndex;
  final int pageCount;
  final String setLabel;

  @override
  State<PageSlider> createState() =>
      // ignore: no_logic_in_create_state
      _PageSliderState(
        pageCount: pageCount,
        pageIndex: pageIndex,
        setLabel: setLabel,
      );
}

class _PageSliderState extends State<PageSlider> {
  int pageIndex;
  int pageCount;
  String setLabel;

  _PageSliderState(
      {required this.setLabel,
      required this.pageCount,
      required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.font_download,
                color: Theme.of(context).cardColor,
              ),
              onPressed: () {
                //  sl<ReaderBloc>().add(ReaderEventNextFont());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopPage(),
                  ),
                );
              },
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      sl<ReaderBloc>().add(ReaderEventDecreaseFontSize());
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).cardColor,
                    )),
                Icon(
                  Icons.format_size,
                  color: Theme.of(context).cardColor,
                ),
                IconButton(
                    onPressed: () {
                      sl<ReaderBloc>().add(ReaderEventIncreaseFontSize());
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).cardColor,
                    ))
              ],
            ),
            TextButton(
              child: Text(
                setLabel,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                ),
              ),
              onPressed: () {
                sl<ReaderBloc>().add(ReaderEventNextSet());
              },
            ),
          ],
        ),
        Divider(color: Theme.of(context).cardColor),
        Text('page ${pageIndex + 1} / $pageCount'),
        BlocListener<ReaderBloc, ReaderState>(
          listener: (context, state) {
            setState(() {
              setLabel = ((state as ReaderLoaded).set == SubstitutionSet.en)
                  ? 'EN'
                  : 'RU';
              pageIndex = (state as ReaderLoaded).pageIndex;
            });
          },
          child: Slider(
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
          ),
        )
      ],
    );
  }
}
