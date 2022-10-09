import 'package:AlphaReader/domain/entities/substitutions.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

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
    Map<Object, String> readableElements = {};
    var document = parse(text);
    collectElementsWithoutChildrens(
      readableElements,
      document,
    );
    readableElements.forEach(
      (node, text) {
        (node as Node).text = _mix(text);
      },
    );
    return _mix(document.outerHtml);
  }

  void collectElementsWithoutChildrens(
    Map<Object, String> readableElements,
    Node node,
  ) {
    if (node.hasChildNodes()) {
      for (var child in node.children) {
        collectElementsWithoutChildrens(readableElements, child);
      }
    } else {
      if (node.text != null) {
        readableElements[node] = node.text!;
      }
    }
  }

  String addSub(String text, List<String>? subs) {
    if (subs != null) {
      return text + subs[0];
    }
    return text;
  }

  String _mix(text) {
    String pattern = '(${[...subMap.keys].join('|')})';
    String result = text.toLowerCase().replaceAllMapped(
        RegExp(pattern), (match) => _transliterate(match, subMap));
    return result;
  }

  String _transliterate(match, subMap) {
    String from = match?.group(0);
    List<String> to = subMap[from] ?? [];
    String result = (to.isNotEmpty) ? to[0] : from;
    return result;
  }
}
