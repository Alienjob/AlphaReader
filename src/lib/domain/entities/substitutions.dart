// ignore_for_file: camel_case_types

import 'dart:convert';

enum SubstitutionSet { ru, en }

class Substitution {
  final String from;
  final String to;
  bool active;
  final SubstitutionSet set;

  Substitution(this.from, this.to, this.active, this.set);

  String get key {
    return 'key${utf8.encode('${from}_$to')}';
  }
}

class Substitutions {
  List<Substitution> pairs;

  Substitutions.fromString(
    String savedSubstitutions,
  ) : pairs = _fromString(savedSubstitutions);

  Substitutions.all() : pairs = _all();

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
          sub.set,
        ),
      );
    }

    return result;
  }

  static List<Substitution> _all() {
    var def = _defaultPairs();
    List<Substitution> result = [];
    for (Substitution sub in def) {
      result.add(
        Substitution(
          sub.from,
          sub.to,
          true,
          sub.set,
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
    // var _html = parse('');
    // _html.createDocumentFragment().;

    var ru = SubstitutionSet.ru;
    var en = SubstitutionSet.en;
    return [
      //Substitution('а', 'Ა', false),
      Substitution('а', '\u10D0', false, ru),
      Substitution('a', '\u10D0', false, en),

      //Substitution('б', 'Ბ', false),
      Substitution('б', '\u10D1', false, ru),
      Substitution('b', '\u10D1', false, en),

      //Substitution('г', 'Გ', false),
      Substitution('г', '\u10D2', false, ru),
      Substitution('g', '\u10D2', false, en),

      //Substitution('д', 'Დ', false),
      Substitution('д', '\u10D3', false, ru),
      Substitution('d', '\u10D3', false, en),

      //Substitution('е', 'Ე', false),
      Substitution('е', '\u10D4', false, ru),
      Substitution('ё', '\u10D4', false, ru),
      Substitution('ы', '\u10D4', false, ru),
      Substitution('э', '\u10D4', false, ru),
      Substitution('e', '\u10D4', false, en),

      //Substitution('в', 'Ვ', false),
      Substitution('в', '\u10D5', false, ru),
      Substitution('v', '\u10D5', false, en),
      Substitution('w', '\u10D5', false, en),

      //Substitution('з', 'Ზ', false),
      Substitution('з', '\u10D6', false, ru),
      Substitution('z', '\u10D6', false, en),

      //Substitution('т', 'Თ', false),
      Substitution('т', '\u10D7', false, ru),
      Substitution('t', '\u10D7', false, en),

      //Substitution('и', 'Ი', false),
      Substitution('и', '\u10D8', false, ru),
      Substitution('i', '\u10D8', false, en),

      //Substitution('к', 'Კ', false),
      Substitution('к', '\u10D9', false, ru),
      Substitution('k', '\u10D9', false, en),

      //Substitution('л', 'Ლ', false),
      Substitution('л', '\u10DA', false, ru),
      Substitution('l', '\u10DA', false, en),

      //Substitution('м', 'Მ', false),
      Substitution('м', '\u10DB', false, ru),
      Substitution('m', '\u10DB', false, en),

      //Substitution('н', 'Ნ', false),
      Substitution('н', '\u10DC', false, ru),
      Substitution('n', '\u10DC', false, en),

      //Substitution('о', 'Ო', false),
      Substitution('о', '\u10DD', false, ru),
      Substitution('o', '\u10DD', false, en),

      //Substitution('п', 'Პ', false),
      Substitution('п', '\u10DE', false, ru),
      Substitution('p', '\u10DE', false, en),

      //Substitution('ж', 'Ჟ', false),
      Substitution('ж', '\u10DF', false, ru),
      Substitution('j', '\u10DF', false, en),

      //Substitution('р', 'Რ', false),
      Substitution('р', '\u10E0', false, ru),
      Substitution('r', '\u10E0', false, en),

      //Substitution('с', 'Ს', false),
      Substitution('с', '\u10E1', false, ru),
      Substitution('c', '\u10E1', false, en),
      Substitution('s', '\u10E1', false, en),

      //Substitution('т', 'Ტ', false),
      Substitution('т', '\u10E2', false, ru),
      Substitution('t', '\u10E2', false, en),

      //Substitution('у', 'Უ', false),
      Substitution('у', '\u10E3', false, ru),
      Substitution('u', '\u10E3', false, en),

      //Substitution('ф', 'Ფ', false),
      Substitution('ф', '\u10E4', false, ru),
      Substitution('f', '\u10E4', false, en),

      //Substitution('к', 'Ქ', false),
      Substitution('к', '\u10E5', false, ru),
      Substitution('k', '\u10E5', false, en),

      //Substitution('г', 'Ღ', false),
      Substitution('г', '\u10E6', false, ru),
      Substitution('g', '\u10E6', false, en),

      //Substitution('к', 'Ყ', false),
      Substitution('к', '\u10E7', false, ru),
      Substitution('k', '\u10E7', false, en),

      //Substitution('ш', 'Შ', false),
      Substitution('ш', '\u10E8', false, ru),
      Substitution('щ', '\u10E8', false, ru),
      Substitution('sh', '\u10E8', false, en),

      //Substitution('ч', 'Ჩ', false),
      Substitution('ч', '\u10E9', false, ru),
      Substitution('ch', '\u10E9', false, en),

      //Substitution('ц', 'Ც', false),
      Substitution('ц', '\u10EA', false, ru),
      //Substitution('ц', '\u10EA', false, en),

      //Substitution('д', 'Ძ', false),
      Substitution('д', '\u10EB', false, ru),
      Substitution('d', '\u10EB', false, en),

      //Substitution('ц', 'Წ', false),
      Substitution('ц', '\u10EC', false, ru),
      //Substitution('ц', '\u10EC', false, en),

      //Substitution('ч', 'Ჭ', false),
      Substitution('ч', '\u10ED', false, ru),
      Substitution('ch', '\u10ED', false, en),

      //Substitution('к', 'Ხ', false),
      Substitution('к', '\u10EE', false, ru),
      Substitution('k', '\u10EE', false, en),

      //Substitution('д', 'Ჯ', false),
      Substitution('д', '\u10EF', false, ru),
      Substitution('d', '\u10EF', false, en),

      //Substitution('х', 'Ჰ', false),
      Substitution('х', '\u10F0', false, ru),
      Substitution('h', '\u10F0', false, en),

      Substitution('й', '\u10D8', false, ru),
      Substitution('ъ', '', false, ru),
      Substitution('ь', '', false, ru),
      //Substitution('ю', 'ᲘᲣ', false),
      Substitution('ю', '\u10D8\u10E3', false, ru),
      //Substitution('я', 'ᲘᲐ', false),
      Substitution('я', '\u10D8\u10D0', false, ru),
    ];
  }
}
