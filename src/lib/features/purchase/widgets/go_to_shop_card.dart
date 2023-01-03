import 'package:alpha_reader/pages/shop.dart';
import 'package:flutter/material.dart';

class GoToShopCard extends StatelessWidget {
  const GoToShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                border: Border.all(color: Colors.blueAccent),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Перейти в магазин'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
