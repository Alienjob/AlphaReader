import 'package:AlphaReader/domain/entities/book.dart';
import 'package:fb2_parse/fb2_parse.dart' as fb2_parse;

class FB2Book implements IBook {
  fb2_parse.FB2Book _souce;

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
  String get imageData {
    return _souce.images[0].bytes;
  }

  @override
  int get length {
    return _souce.body.sections?.length ?? 0;
  }

  @override
  String pageText(int pageIndex) {
    return _souce.body.sections![pageIndex].content ?? '';
  }
}
