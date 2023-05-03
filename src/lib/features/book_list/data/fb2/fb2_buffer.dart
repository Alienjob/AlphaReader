import 'package:alpha_reader/features/book_list/data/fb2/fb2_book.dart';
import 'package:alpha_reader/mixer/mixer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fb2_parse/fb2_parse.dart' as fb2_parse;
import 'package:alpha_reader/domain/entities/page.dart' as d;

class FB2Buffer {
  final SharedPreferences sharedPreferences;

  FB2Buffer({required this.sharedPreferences});

  String _makeKey(String bookID, int page) {
    return ('buffer Book $bookID page $page');
  }

  Future<int> buffering(String bookID, String path) async {
    var souce = fb2_parse.FB2Book(path);
    await souce.parse();
    int pageIndex = 0;

    for (var section in souce.body.sections!) {
      List<String> divided = Mixer.divide(section.content, FB2Book.PAGE_LENGHT);
      int number = 1;
      for (var part in divided) {
        final title = (divided.length > 1)
            ? '($number)${section.title ?? 'untitled'}'
            : (section.title ?? 'untitled');
        _save(bookID, pageIndex, d.Page(title: title, body: part).toJSON());
        pageIndex++;
        number++;
      }
    }

    return pageIndex;
  }

  Future<String> get(String bookID, int page) async {
    return d.Page.fromJSON(await _load(bookID, page)).body;
  }

  Future<String> _load(String bookID, int page) async {
    sharedPreferences.reload();
    return sharedPreferences.getString(_makeKey(bookID, page)) ?? '';
  }

  Future<void> _save(String bookID, int page, String text) async {
    await sharedPreferences.setString(_makeKey(bookID, page), text);
  }
}
