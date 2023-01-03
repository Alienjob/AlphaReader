import 'package:alpha_reader/features/fonts/bloc/font_bloc.dart';
import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:alpha_reader/features/purchase/widgets/go_to_shop_card.dart';
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
          final bool additionalFontsAcceseble =
              (state.storeData.fonts == StoreDataPurchaseStatus.purchased);
          return Column(
            children: [
              const GoToShopCard(),
              ...state.fonts
                  .map((e) => FontTile(
                        desc: e,
                        additionalFontsAcceseble: additionalFontsAcceseble,
                        tapHandler: () {
                          Navigator.of(context).pop(e);
                        },
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
  const FontTile(
      {super.key,
      required this.desc,
      required this.additionalFontsAcceseble,
      required this.tapHandler});
  final FontDescription desc;
  final bool additionalFontsAcceseble;
  final void Function() tapHandler;
  static const String exampleText =
      'фбв abc აბგდევზთიკლმნოპჟრსტუფქღყშჩცძწჭხჯჰჱჲჳჴჵჶჷჸჹჺ';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: tapHandler,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: ((desc.embedded) || (additionalFontsAcceseble))
                      ? Colors.green
                      : Theme.of(context).dialogBackgroundColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(desc.family),
                Text(
                  exampleText,
                  style: TextStyle(fontFamily: desc.family),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
