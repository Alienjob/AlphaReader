import 'package:AlphaReader/domain/entities/book.dart';
import 'package:fb2_parse/fb2_parse.dart' as fb2_parse;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:typed_data';

class FB2Book implements IBook {
  final fb2_parse.FB2Book _souce;

  FB2Book._(this._souce);

  static Future<FB2Book> ofPath({required String path}) async {
    var fb2souce = fb2_parse.FB2Book(path);
    await fb2souce.parse();
    return FB2Book._(fb2souce);
  }

  @override
  String get key {
    return _souce.path;
  }

  @override
  String get title {
    return _souce.description.bookTitle ?? '';
  }

  @override
  String get description {
    return _souce.description.annotation ?? '';
  }

  @override
  Uint8List get imageData {
    return dataFromBase64String(_souce.images[0].bytes);
  }

  @override
  int get length {
    return _souce.body.sections?.length ?? 0;
  }

  @override
  String pageText(int pageIndex) {
    return _souce.body.sections![pageIndex].content ?? '';
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
