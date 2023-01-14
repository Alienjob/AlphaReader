import 'package:alpha_reader/pages/shop.dart';
import 'package:flutter/material.dart';

class GoToShopCard extends StatelessWidget {
  const GoToShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShopPage(),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Theme.of(context).hintColor,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_checkout_outlined,
                        size: 24,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                          child: Text(
                              'Дополнительные шрифты и отключение рекламы')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
