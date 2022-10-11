import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/injection_container.dart';

import 'package:flutter/material.dart';

class ReaderSubList extends StatelessWidget {
  const ReaderSubList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ReaderLoaded state;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
      ),
      child: GridView.count(crossAxisCount: 6, children: [
        ...(state.sub.pairs.map((sub) => SizedBox(
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
                sl<ReaderBloc>().add(
                  ReaderEventOnOffSubstitution(
                    substitution: sub,
                  ),
                );
              },
            ))))
      ]),
    );
  }
}
