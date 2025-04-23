import '/features/purchase/store_data.dart';
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
                          style: const TextStyle(fontSize: 16),
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
                              style: const TextStyle(fontSize: 20),
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

  String _formatDisplayPrice() {
    if (price == '-.-') return price;

    // Handle cases where currency symbol is before or after the number
    final beforeMatch = RegExp(r'([¥€$£₹])\s*([\d.]+)').firstMatch(price);
    final afterMatch = RegExp(r'([\d.]+)\s*([¥€$£₹])').firstMatch(price);

    if (beforeMatch != null) {
      return '${beforeMatch.group(1)} ${beforeMatch.group(2)}';
    }
    if (afterMatch != null) {
      return '${afterMatch.group(1)} ${afterMatch.group(2)}';
    }

    // For placeholder prices with description
    return '$price ${priceDescription.trim()}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _formatDisplayPrice(),
        style: priceStyle,
      ),
    );
  }
}
