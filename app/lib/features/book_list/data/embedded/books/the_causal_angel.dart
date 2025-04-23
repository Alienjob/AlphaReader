import 'dart:io';

import '/domain/entities/book.dart';
import '/features/book_list/data/fb2/fb2_book.dart';
import '/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '/alpha_image_cache.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TheCausalAngelBook extends IBook {
  late FB2Book _book;

  TheCausalAngelBook();

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "TheCausalAngel.fb2");
    final fileExist = await File(path).exists();
    if (!fileExist) {
      ByteData data = await rootBundle
          .load("assets/books/TheCausalAngel/TheCausalAngel.fb2");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }
    _book = await FB2Book.ofPath(path: path);
  }

  @override
  String get key {
    return 'TheCausalAngel';
  }

  @override
  String get title {
    return 'Каузальный ангел';
  }

  @override
  String get description {
    return 'Жан ле Фламбер, самый знаменитый вор в Солнечной системе, способен украсть что угодно и любого обвести вокруг пальца. Он невероятно изобретателен и поразительно везуч. Жану удалось выбраться из тюрьмы, вырваться из пекла апокалипсиса и проникнуть в разум живого бога. На этот раз перед ним стоит новая задача: отыскать и выручить из беды наемницу Миели, которая когда-то спасла ему жизнь. Но в разгар жестокой войны между богами сделать это совсем непросто. К тому же для осуществления своего плана ле Фламберу необходимы весьма необычные инструменты: яйцо из компьютрониума, пара физических тел, несколько водородных бомб и, конечно, космический корабль — незаменимый «Леблан», не раз помогавший вору вовремя унести ноги. Сумеет ли Жан и на этот раз выйти сухим из воды?';
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
  Future<String> pageText(int pageIndex) {
    return _book.pageText(pageIndex);
  }

  @override
  bool get ready {
    return _book.buffered;
  }
}
