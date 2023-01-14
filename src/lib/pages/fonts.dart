import 'package:alpha_reader/features/fonts/bloc/font_bloc.dart';
import 'package:alpha_reader/features/fonts/widgets/font_list_welcome.dart';
import 'package:alpha_reader/features/fonts/widgets/font_tile.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:alpha_reader/features/purchase/widgets/go_to_shop_card.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:alpha_reader/pages/shop.dart';
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
          return Container(
            color: Theme.of(context).dialogBackgroundColor,
            child: Column(
              children: [
                const FontListWelcome(),
                const GoToShopCard(),
                ...state.fonts
                    .map((e) => FontTile(
                          desc: e,
                          additionalFontsAcceseble: additionalFontsAcceseble,
                          tapHandler: () {
                            if (additionalFontsAcceseble || e.embedded) {
                              Navigator.of(context).pop(e);
                            } else {
                              // в магазин
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ShopPage(),
                                ),
                              );
                            }
                          },
                        ))
                    .toList()
              ],
            ),
          );
        },
      ),
    );
  }
}
