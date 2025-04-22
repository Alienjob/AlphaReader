// ignore_for_file: constant_identifier_names

import '/domain/entities/book.dart';
import '/features/book_list/data/fb2/fb2_buffer.dart';
import '/features/book_list/data/fb2/fb2_executor.dart';
import '/injection_container.dart';
import 'package:fb2_parse/fb2_parse.dart' as fb2_parse;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '/alpha_image_cache.dart';

import 'package:flutter/material.dart';

class FB2Book implements IBook {
  static const PAGE_LENGHT = 500;
  static const SMART_PAGES = true;

  final fb2_parse.FB2Book _souce;
  int _lenght;
  bool buffered;
  //final List<d.Page> pages = [];

  FB2Book._(this._souce, String path)
      : buffered = false,
        _lenght = 0 {
    FB2Executor.buffering(key, path, FB2Executor.instance().token)
        .then((value) {
      buffered = true;
      _lenght = value;
    });
  }

  static Future<FB2Book> ofPath({required String path}) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    var fb2souce = fb2_parse.FB2Book(path);
    await fb2souce.parse();
    int end = DateTime.now().millisecondsSinceEpoch;
    debugPrint('parse time ${end - start}');
    return FB2Book._(fb2souce, path);
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
  Image get imageObject {
    var cache = sl<AlphaImageCache>();
    var img = cache.get(key: key);
    if (img == null) {
      cache.addUint8List(key: key, value: imageData);
      img = cache.get(key: key);
    }

    return img!;
  }

  @override
  int get length {
    if (SMART_PAGES) {
      return _lenght;
    } else {
      return _souce.body.sections?.length ?? 0;
    }
  }

  @override
  Future<String> pageText(int pageIndex) async {
    if (SMART_PAGES) {
      return await (sl<FB2Buffer>().get(key, pageIndex));
    } else {
      return _souce.body.sections![pageIndex].content ?? '';
    }
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String.replaceAll(RegExp(r'\s+'), ''));
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  @override
  bool get ready => buffered;
}
