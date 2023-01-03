import 'package:alpha_reader/features/purchase/bloc/shop_bloc.dart';
import 'package:alpha_reader/features/purchase/purchase_repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:alpha_reader/injection_container.dart';
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
              title: 'Без рекламы',
              handler: () => bloc.add(ShopEventBuy(adFreeID)),
            ),
            ShopItemTile(
              status: state.data.fonts,
              title: 'Дополнительные шрифты',
              handler: () => bloc.add(ShopEventBuy(additionalFontsID)),
            ),
          ]),
        );
      },
    );
  }
}

class ShopItemTile extends StatelessWidget {
  const ShopItemTile({
    Key? key,
    required this.status,
    required this.title,
    required this.handler,
  }) : super(key: key);

  final StoreDataPurchaseStatus status;
  final String title;
  final void Function() handler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: handler,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Column(
                  children: [
                    Text(title),
                    (status == StoreDataPurchaseStatus.unavalable)
                        ? const Text('недоступен')
                        : (status == StoreDataPurchaseStatus.purchasable)
                            ? const Text('1\$')
                            : (status == StoreDataPurchaseStatus.pending)
                                ? const CircularProgressIndicator()
                                : (status == StoreDataPurchaseStatus.purchased)
                                    ? const Text('Куплено')
                                    : const Text('Ошибка'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
