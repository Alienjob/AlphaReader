import 'package:flutter/material.dart';

class FontListWelcome extends StatelessWidget {
  const FontListWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                'Каждая буква грузинского языка имеет множество вариантов начертаний. '
                'Чтобы уверенно читать вывески и уличные надписи '
                'попробуйте свои силы с этими шрифтами:'),
          )),
    );
  }
}
