import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class IBook {
  String get key;
  String get title;
  String get description;
  Uint8List get imageData;
  Image get imageObject;

  int get length;

  String pageText(int pageIndex);
}
