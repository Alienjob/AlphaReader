import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:flutter/material.dart';

class ShopItemTile extends StatelessWidget {
  const ShopItemTile({
    Key? key,
    required this.status,
    required this.title,
    required this.handler,
    required this.priceDescription,
    required this.price,
  }) : super(key: key);

  final StoreDataPurchaseStatus status;
  final String title;
  final String priceDescription;
  final String price;
  final void Function() handler;

  @override
  Widget build(BuildContext context) {
    final purchased = (status == StoreDataPurchaseStatus.purchased);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: purchased
                        ? Theme.of(context).focusColor
                        : Theme.of(context).hintColor),
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _PriceRow(
                        purchased: purchased,
                        price: price,
                        priceDescription: priceDescription),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: GestureDetector(
                        onTap: handler,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: purchased
                                    ? Theme.of(context).focusColor
                                    : Theme.of(context).hintColor),
                            color: Theme.of(context).dialogBackgroundColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              purchased ? 'КУПЛЕНО' : 'КУПИТЬ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// (status == StoreDataPurchaseStatus.unavalable)
//                         ? const Text('недоступен')
//                         : (status == StoreDataPurchaseStatus.purchasable)
//                             ? const Text('1\$')
//                             : (status == StoreDataPurchaseStatus.pending)
//                                 ? const CircularProgressIndicator()
//                                 : (status == StoreDataPurchaseStatus.purchased)
//                                     ? const Text('Куплено')
//                                     : const Text('Ошибка'),

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    Key? key,
    required this.purchased,
    required this.price,
    required this.priceDescription,
  }) : super(key: key);

  static const TextStyle priceStyle = TextStyle(
    fontSize: 24,
  );
  final bool purchased;
  final String price;
  final String priceDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          price,
          style: priceStyle,
        ),
        const SizedBox(width: 5),
        Text(
          priceDescription,
          style: priceStyle,
        ),
      ],
    );
  }
}