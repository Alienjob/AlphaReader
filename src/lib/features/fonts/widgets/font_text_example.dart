import '/features/fonts/repository.dart';
import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({
    Key? key,
    required this.example,
    required this.desc,
    required this.title,
  }) : super(key: key);

  final String title;
  final String example;
  final FontDescription desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 35,
            child: Text(
              title,
              style: TextStyle(color: Theme.of(context).focusColor),
            )),
        Flexible(
          child: Text(
            example,
            style: TextStyle(fontFamily: desc.family),
          ),
        )
      ]),
    );
  }
}
