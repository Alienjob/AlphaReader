import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'dart:math';

class Mixer {
  Map<String, List<String>> subMap = {};
  Random rand = Random();
  bool useRandom = true;

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
    var document = parse(text);
    replaseSubElementsWithoutChildrens(
      document,
    );
    return document.outerHtml;
  }

  void replaseSubElementsWithoutChildrens(
    dom.Node node,
  ) {
    // if ((node.children.isEmpty) && (node.text != null) && (node.text != '')) {
    //   node.text = _mix(node.text!);
    // }

    if ((node.nodeType == 3) && ((node as dom.Text).data != '')) {
      node.data = _mix(node.data);
    }

    for (var child in node.nodes) {
      replaseSubElementsWithoutChildrens(child);
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
    if (to.isEmpty) {
      return from;
    }

    int r = (useRandom) ? rand.nextInt(to.length) : 0;
    String result = (to.isNotEmpty) ? to[r] : from;
    return result;
  }
}
