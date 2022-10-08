import 'package:flutter/foundation.dart';

abstract class IBook {
  String get key;
  String get title;
  String get description;
  Uint8List get imageData;

  int get length;

  String pageText(int pageIndex);
}
