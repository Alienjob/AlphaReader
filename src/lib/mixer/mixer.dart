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
    String result = '';
    for (int i = 0; i < text.length - 1; i++) {
      String key2 = text.substring(i, i + 2).toLowerCase();
      String key1 = text.substring(i, i + 1).toLowerCase();

      if (subMap[key2] != null) {
        result = addSub(result, subMap[key2]);
        i++;
      } else if (subMap[key1] != null) {
        result = addSub(result, subMap[key1]);
      } else {
        result = result + key1;
      }
    }

    String key1 = text.substring(text.length - 1, text.length);

    if (subMap[key1] != null) {
      result = addSub(result, subMap[key1]);
    } else {
      result = result + key1;
    }
    return result;
  }

  String addSub(String text, List<String>? subs) {
    if (subs != null) {
      return text + subs[0];
    }
    return text;
  }
}
