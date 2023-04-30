// ignore_for_file: constant_identifier_names

import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/entities/page.dart' as d;
import 'package:alpha_reader/injection_container.dart';
import 'package:alpha_reader/mixer/mixer.dart';
import 'package:fb2_parse/fb2_parse.dart' as fb2_parse;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:alpha_reader/alpha_image_cache.dart';

import 'package:flutter/material.dart';

const PAGE_LENGHT = 500;
const SMART_PAGES = true;

class FB2Book implements IBook {
  final fb2_parse.FB2Book _souce;
  final List<d.Page> pages = [];

  FB2Book._(this._souce) {
    int start = DateTime.now().millisecondsSinceEpoch;
    if (!SMART_PAGES) return;
    for (var section in _souce.body.sections!) {
      List<String> divided = Mixer.divide(section.content, PAGE_LENGHT);
      int number = 1;
      for (var part in divided) {
        final title = (divided.length > 1)
            ? '($number)${section.title ?? 'untitled'}'
            : (section.title ?? 'untitled');
        pages.add(d.Page(title: title, body: part));
        number++;
      }
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    print('parse time ${end - start}');
  }

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
      return pages.length;
    } else {
      return _souce.body.sections?.length ?? 0;
    }
  }

  @override
  String pageText(int pageIndex) {
    if (SMART_PAGES) {
      return pages[pageIndex].body;
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
}
