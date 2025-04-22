import '/features/fonts/repository.dart';
import '/features/fonts/widgets/font_text_example.dart';

import 'package:flutter/material.dart';

class FontTile extends StatelessWidget {
  const FontTile(
      {super.key,
      required this.desc,
      required this.additionalFontsAcceseble,
      required this.tapHandler});
  final FontDescription desc;
  final bool additionalFontsAcceseble;
  final void Function() tapHandler;
  static const String russiaText =
      'съешь ещё этих мягких французских булок, да выпей чаю';
  static const String englishText =
      'the quick brown fox jumps over the lazy dog';
  static const String georgianText =
      'ყველა საქმე ძნელია, თუ გაკეთება გეზარებაო';

  //'აბგდევზთიკლმნოპჟრსტუფქღყშჩცძწჭხჯჰ'; //ჱჲჳჴჵჶჷჸჹჺ
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: tapHandler,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        TextExample(
                            example: russiaText, desc: desc, title: 'рус:'),
                        TextExample(
                            example: englishText, desc: desc, title: 'eng:'),
                        TextExample(
                            example: georgianText, desc: desc, title: 'geo:'),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (additionalFontsAcceseble || desc.embedded)
                            ? Theme.of(context).focusColor
                            : Theme.of(context).hintColor),
                    color: Theme.of(context).dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 5),
                        Text(
                          desc.family,
                          style: TextStyle(
                              fontSize: 24,
                              color: (additionalFontsAcceseble || desc.embedded)
                                  ? Theme.of(context).focusColor
                                  : Theme.of(context).hintColor),
                        ),
                        const SizedBox(width: 5),
                        if (!(desc.embedded || additionalFontsAcceseble)) ...[
                          Icon(
                            Icons.shopping_cart,
                            size: 24,
                            color: Theme.of(context).hintColor,
                          ),
                          const SizedBox(width: 5),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
