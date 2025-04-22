import '/features/admob/presentation/banner_tile.dart';
import '/features/purchase/bloc/shop_bloc.dart';
import '/features/purchase/purchase_repository.dart';
import '/features/purchase/widgets/shop_item_tile.dart';
import '/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShopBloc>()..add(ShopEventInit()),
      child: Scaffold(
        body: const ShopForm(),
        appBar: AppBar(
          title: const Text('Shop'),
        ),
      ),
    );
  }
}

class ShopForm extends StatelessWidget {
  const ShopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<ShopBloc>(context);
        if (state.isProcessing) return const CircularProgressIndicator();
        if (!state.data.available) return const Text('Магазин не доступен');
        return SingleChildScrollView(
          child: Column(children: [
            ShopItemTile(
              status: state.data.adFree,
              title: 'Отсутствие рекламы в приложении',
              price: '1\$',
              priceDescription: 'в месяц',
              handler: () => bloc.add(ShopEventBuy(adFreeID)),
            ),
            ShopItemTile(
              status: state.data.fonts,
              title: 'Множество шрифтов с различными начертаниями букв',
              price: '1\$',
              priceDescription: 'навсегда',
              handler: () => bloc.add(ShopEventBuy(additionalFontsID)),
            ),
            const BannerTile(),
          ]),
        );
      },
    );
  }
}
