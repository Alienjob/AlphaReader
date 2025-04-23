import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AlphaImageCache {
  final Map<String, Image> _storage = {};

  void add({required String key, required Image value}) {
    _storage[key] = value;
  }

  void addUint8List({required String key, required Uint8List value}) {
    _storage[key] = Image.memory(value);
  }

  Image? get({required String key}) {
    return _storage[key];
  }
}
