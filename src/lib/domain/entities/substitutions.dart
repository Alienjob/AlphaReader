import 'dart:convert';

class Substitution {
  final String from;
  final String to;
  bool active;

  Substitution(this.from, this.to, this.active);

  String get key {
    return 'key${utf8.encode('${from}_$to')}';
  }
}

class Substitutions {
  List<Substitution> pairs;

  Substitutions.fromString(
    String savedSubstitutions,
  ) : pairs = _fromString(savedSubstitutions);

  Substitutions() : pairs = _defaultPairs();

  static List<Substitution> _fromString(String savedSubstitutions) {
    var def = _defaultPairs();
    List<Substitution> result = [];
    Map<String, dynamic> subMap = json.decode(savedSubstitutions);
    for (Substitution sub in def) {
      bool isActive = (subMap[sub.key] != null);
      result.add(
        Substitution(
          sub.from,
          sub.to,
          isActive,
        ),
      );
    }

    return result;
  }

  static String toStringMap(List<Substitution> pairs) {
    Map<String, bool> subMap = {};
    for (Substitution sub in pairs) {
      if (sub.active) {
        subMap[sub.key] = true;
      }
    }
    return json.encode(subMap);
  }

  static List<Substitution> _defaultPairs() {
    return [
      Substitution('а', 'Ა', false),
      Substitution('б', 'Ბ', false),
      Substitution('в', 'Ვ', false),
      Substitution('г', 'Გ', false),
      Substitution('гх', 'Ღ', false),
      Substitution('д', 'Დ', false),
      Substitution('дз', 'Ძ', false),
      Substitution('дж', 'Ჯ', false),
      Substitution('е', 'Ე', false),
      Substitution('ё', 'Ე', false),
      Substitution('ж', 'Ჟ', false),
      Substitution('з', 'Ზ', false),
      Substitution('и', 'Ი', false),
      Substitution('к', 'Კ', false),
      Substitution('к', 'Ყ', false),
      Substitution('кх', 'Ხ', false),
      Substitution('кх', 'Ქ', false),
      Substitution('л', 'Ლ', false),
      Substitution('м', 'Მ', false),
      Substitution('н', 'Ნ', false),
      Substitution('о', 'Ო', false),
      Substitution('п', 'Პ', false),
      Substitution('пх', 'Ფ', false),
      Substitution('р', 'Რ', false),
      Substitution('с', 'Ს', false),
      Substitution('т', 'Ტ', false),
      Substitution('т', 'Თ', false),
      Substitution('у', 'Უ', false),
      Substitution('ф', 'Ფ', false),
      Substitution('х', 'Ჰ', false),
      Substitution('ц', 'Ც', false),
      Substitution('ц', 'Წ', false),
      Substitution('ч', 'Ჩ', false),
      Substitution('ч', 'Ჭ', false),
      Substitution('ш', 'Შ', false),
      Substitution('щ', 'Შ', false),
      Substitution('ъ', '', false),
      Substitution('ы', 'Ე', false),
      Substitution('ь', '', false),
      Substitution('э', 'Ე', false),
      Substitution('ю', 'ᲘᲣ', false),
      Substitution('я', 'ᲘᲐ', false),
    ];
  }
}
