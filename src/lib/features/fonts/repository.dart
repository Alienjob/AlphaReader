import 'package:alpha_reader/features/fonts/font_lists.dart';

class AlphaReaderFont {
  final String family;

  AlphaReaderFont(this.family);
}

class FontDescription {
  final bool embedded;
  final String family;

  FontDescription(this.embedded, this.family);
}

class FontRepositary {
  final List<FontDescription> _fonts = [];

  Future<List<FontDescription>> all() async {
    return _fonts;
  }

  Future<void> init() async {
    for (var family in embedded) {
      _fonts.add(FontDescription(
        true,
        family,
      ));
    }
    for (var family in pay) {
      _fonts.add(FontDescription(
        false,
        family,
      ));
    }
  }
}
