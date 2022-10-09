import 'package:AlphaReader/domain/entities/substitutions.dart';

class Mixer {
  Map<String, List<String>> subMap = {};

  Mixer(Substitutions substitutions) {
    subMap = {};
    for (final substitution in substitutions.pairs) {
      if (substitution.active) {
        if (subMap[substitution.from] == null) {
          subMap[substitution.from] = [substitution.to];
        } else {
          subMap[substitution.from]!.add(substitution.to);
        }
      }
    }
  }

  String mix(String text) {
    String pattern = '(${[...subMap.keys].join('|')})';
    String result = text.toLowerCase().replaceAllMapped(
        RegExp(pattern), (match) => _transliterate(match, subMap));
    return result;
  }

  String addSub(String text, List<String>? subs) {
    if (subs != null) {
      return text + subs[0];
    }
    return text;
  }

  String _transliterate(match, subMap) {
    String from = match?.group(0);
    List<String> to = subMap[from] ?? [];
    String result = (to.isNotEmpty) ? to[0] : from;
    return result;
  }
}
