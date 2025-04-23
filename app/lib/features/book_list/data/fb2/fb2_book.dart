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

  final fb2_parse.FB2Book _source;
  int _lenght;
  bool buffered;
  //final List<d.Page> pages = [];

  FB2Book._(this._source, String path)
      : buffered = false,
        _lenght = 0 {
    FB2Executor.buffering(key, path, FB2Executor.instance().token)
        .then((value) {
      buffered = true;
      _lenght = value;
    }).catchError((error) {
      debugPrint('Error during buffering: $error');
      // Keep buffered as false to indicate loading failed
    });
  }

  static Future<FB2Book> ofPath({required String path}) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    var fb2source = fb2_parse.FB2Book(path);

    try {
      await fb2source.parse();
    } catch (e) {
      debugPrint('Error parsing FB2 file: $e');
      rethrow; // Rethrow to let the caller handle the error
    }

    int end = DateTime.now().millisecondsSinceEpoch;
    debugPrint('parse time ${end - start}');
    return FB2Book._(fb2source, path);
  }

  @override
  String get key {
    try {
      return _source.path ?? 'unknown_book';
    } catch (e) {
      debugPrint('Error getting book key: $e');
      return 'unknown_book';
    }
  }

  @override
  String get title {
    try {
      return _source.description.bookTitle ?? 'Unknown Title';
    } catch (e) {
      debugPrint('Error getting book title: $e');
      return 'Unknown Title';
    }
  }

  @override
  String get description {
    try {
      return _source.description.annotation ?? 'No description available';
    } catch (e) {
      debugPrint('Error getting book description: $e');
      return 'No description available';
    }
  }

  @override
  Uint8List get imageData {
    try {
      if (_source.images.isNotEmpty && (_source.images[0].bytes != null)) {
        return dataFromBase64String(_source.images[0].bytes!);
      }
      return Uint8List(0); // Return empty bytes if no image available
    } catch (e) {
      debugPrint('Error getting image data: $e');
      return Uint8List(0);
    }
  }

  @override
  Image get imageObject {
    try {
      var cache = sl<AlphaImageCache>();
      var img = cache.get(key: key);
      if (img == null) {
        var data = imageData;
        if (data.isEmpty) {
          // Return a placeholder image or throw an exception if needed
          throw Exception('No image data available');
        }
        cache.addUint8List(key: key, value: data);
        img = cache.get(key: key);
        if (img == null) {
          throw Exception('Failed to create image from data');
        }
      }
      return img;
    } catch (e) {
      debugPrint('Error getting image object: $e');
      // Return a placeholder or default image
      return Image.memory(Uint8List(0));
    }
  }

  @override
  int get length {
    try {
      if (SMART_PAGES) {
        return _lenght;
      } else {
        return _source.body.sections?.length ?? 0;
      }
    } catch (e) {
      debugPrint('Error getting book length: $e');
      return 0;
    }
  }

  @override
  Future<String> pageText(int pageIndex) async {
    try {
      if (SMART_PAGES) {
        return await (sl<FB2Buffer>().get(key, pageIndex));
      } else {
        if (_source.body.sections == null ||
            pageIndex >= _source.body.sections!.length) {
          return '';
        }
        return _source.body.sections![pageIndex].content ?? '';
      }
    } catch (e) {
      debugPrint('Error getting page text at index $pageIndex: $e');
      return '';
    }
  }

  Uint8List dataFromBase64String(String base64String) {
    try {
      return base64Decode(base64String.replaceAll(RegExp(r'\s+'), ''));
    } catch (e) {
      debugPrint('Error decoding base64 string: $e');
      return Uint8List(0);
    }
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  @override
  bool get ready => buffered;
}
