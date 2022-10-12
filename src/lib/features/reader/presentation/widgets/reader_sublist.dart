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
        ...(state.sub.pairs.map(
          (sub) => SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                style: (sub.active)
                    ? ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(0),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      )
                    : ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).dialogBackgroundColor),
                      ),
                onPressed: () {
                  sl<ReaderBloc>().add(
                    ReaderEventOnOffSubstitution(
                      substitution: sub,
                    ),
                  );
                },
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
          ),
        )),
      ]),
    );
  }
}
            // child: GestureDetector(
            //   child: Container(
            //     width: 40,
            //     height: 40,
            //     decoration: BoxDecoration(
            //       color: (sub.active)
            //           ? Theme.of(context).focusColor
            //           : Theme.of(context).dialogBackgroundColor,
            //     ),
            //     child: Center(
            //       child: 
            //     ),
            //   ),
            // ))))
