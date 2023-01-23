import 'dart:collection';

import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'dart:math';

class AnchorGenerator {
  int current = 0;
  String get next {
    current++;
    return 'id$current';
  }
}

class Mixer {
  Map<String, List<String>> subMap = {};
  Random rand = Random();
  bool useRandom = true;
  bool useAncors = true;
  var uuid = AnchorGenerator();

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
    if (useAncors) {
      wrapWords(document);
    }
    replaseSubElementsWithoutChildrens(
      document,
    );
    return document.outerHtml;
  }

  void wrapWords(
    dom.Node node,
  ) {
    final iterator = [...node.nodes];

    for (var child in iterator) {
      if ((child.nodeType == 3) && ((child as dom.Text).data != '')) {
        int childIndex = node.nodes.indexOf(child);
        final linesList = child.data.split('\n');
        final wordList = <String>[];
        for (var line in linesList) {
          var currentWordList = line.split(' ');
          for (var word in currentWordList) {
            wordList.add(word);
            wordList.add(' ');
          }
          wordList.removeLast();
          wordList.add('\n');
        }
        wordList.removeLast();
        for (var word in wordList) {
          dom.Element newElement = dom.Element.html('<a id=${uuid.next}></a>');
          dom.Text wordNode = dom.Text(word);
          newElement.nodes.add(wordNode);
          node.nodes.insert(childIndex, newElement);
          childIndex++;
        }
        node.nodes.remove(child);
      } else {
        wrapWords(child);
      }
    }
  }

  void replaseSubElementsWithoutChildrens(
    dom.Node node,
  ) {
    if ((node.nodeType == 3) && ((node as dom.Text).data != '')) {
      node.data = _mix(node.data);
    }
    if ((node.nodeType == 1) && ((node as dom.Element).localName == 'img')) {
      node.attributes = LinkedHashMap.from(node.attributes.map((key, value) {
        if (key != 'src') return MapEntry(key, value);
        return MapEntry(key, value.replaceAll('\n', ''));
      }));
      //print(node.attributes);
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
