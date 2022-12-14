import 'package:alpha_reader/features/fonts/font_lists.dart';

class FontDescription {
  final bool embedded;
  bool buy;
  bool select;
  final String family;

  FontDescription(this.embedded, this.buy, this.select, this.family);
}

class FontRepositary {
  final List<FontDescription> _fonts = [];

  Future<List<FontDescription>> all() async {
    return _fonts;
  }

  Future<List<FontDescription>> selected() async {
    return _fonts.where((e) => e.select).toList();
  }

  Future<List<FontDescription>> select(String family) async {
    for (var desc in _fonts) {
      if (desc.family == family) {
        desc.select = !desc.select;
      }
    }
    return _fonts.where((e) => e.select).toList();
  }

  Future<List<FontDescription>> buy(String family) async {
    for (var desc in _fonts) {
      if (desc.family == family) {
        desc.buy = !desc.buy;
      }
    }
    return _fonts;
  }

  Future<void> init() async {
    for (var family in embedded) {
      _fonts.add(FontDescription(
        true,
        true,
        true,
        family,
      ));
    }
    for (var family in pay) {
      _fonts.add(FontDescription(
        false,
        true,
        true,
        family,
      ));
    }
  }
}
