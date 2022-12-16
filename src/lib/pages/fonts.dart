import 'package:alpha_reader/features/fonts/bloc/font_bloc.dart';
import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontsPage extends StatelessWidget {
  const FontsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FontBloc>()..add(FontEventInit()),
      child: Scaffold(
        body: const FontsForm(),
        appBar: AppBar(),
      ),
    );
  }
}

class FontsForm extends StatelessWidget {
  const FontsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<FontBloc, FontState>(
        builder: (context, state) {
          return Column(
            children: [
              ...state.fonts
                  .map((e) => FontTile(
                        desc: e,
                      ))
                  .toList()
            ],
          );
        },
      ),
    );
  }
}

class FontTile extends StatelessWidget {
  const FontTile({super.key, required this.desc});
  final FontDescription desc;
  static const String exampleText =
      'фбв abc აბგდევზთიკლმნოპჟრსტუფქღყშჩცძწჭხჯჰჱჲჳჴჵჶჷჸჹჺ';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: (desc.embedded)
                    ? Colors.grey
                    : Theme.of(context).dialogBackgroundColor)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(desc.family),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<FontBloc>(context)
                          .add(FontEventSelect(desc.family));
                    },
                    icon: Icon(
                      Icons.done,
                      color: desc.select ? Colors.green : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<FontBloc>(context)
                          .add(FontEventBuy(desc.family));
                    },
                    icon: Icon(
                      Icons.star,
                      color: desc.buy ? Colors.yellow : Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                exampleText,
                style: TextStyle(fontFamily: desc.family),
              )
            ],
          ),
        ),
      ),
    );
  }
}
