import 'dart:io';

import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:alpha_reader/alpha_image_cache.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HPMOR extends IBook {
  late FB2Book _book;

  HPMOR();

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "hpmor_ru.fb2");
    final fileExist = await File(path).exists();
    if (!fileExist) {
      ByteData data =
          await rootBundle.load("assets/books/hpmor_ru/hpmor_ru.fb2");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }
    _book = await FB2Book.ofPath(path: path);
  }

  @override
  String get key {
    return 'hpmor_ru';
  }

  @override
  String get title {
    return 'Гарри Поттер и методы рационального мышления';
  }

  @override
  String get description {
    return 'Петуния вышла замуж не за Дурсля, а за университетского профессора, и Гарри попал в гораздо более благоприятную среду. У него были частные учителя, дискуссии с отцом, а главное — книги, сотни и тысячи научных и фантастических книг. В 11 лет Гарри знаком с квантовой механикой, когнитивной психологией, теорией вероятностей и другими вещами. Но Гарри не просто вундеркинд, у него есть загадочная Тёмная сторона, которая явно накладывает свой отпечаток на его мышление.';
  }

  @override
  Uint8List get imageData {
    return _book.imageData;
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
    return _book.length;
  }

  @override
  String pageText(int pageIndex) {
    return _book.pageText(pageIndex);
  }
}
