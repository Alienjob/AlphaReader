import 'dart:collection';
import 'dart:isolate';

import '/domain/entities/substitutions.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'dart:math';

import 'package:worker_manager/worker_manager.dart';

class MixerExecutor {
  static MixerExecutor? _instance;

  final Map<String, String> cache;
  final Set<Cancelable> tasks;

  MixerExecutor._()
      : cache = {},
        tasks = {};

  factory MixerExecutor.instance() {
    _instance ??= MixerExecutor._();
    return _instance!;
  }

  static Future<String> mix(Substitutions sub, String text) async {
    String? result;
    try {
      MixerExecutor i = MixerExecutor.instance();
      for (var task in i.tasks) {
        task.cancel();
        i.tasks.remove(task);
      }
      var mSubs = Substitutions.toStringMap(sub.pairs);
      String key = '${mSubs.hashCode} ${text.hashCode}';
      result = i.cache[key];
      if (result == null) {
        Cancelable task = workerManager.execute<String>(
            () => _mix(Substitutions.toStringMap(sub.pairs), text),
            priority: WorkPriority.high);
        result = await task;
        i.cache[key] = result!;
      }
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  static Future<int> fibonacci(int input) async {
    int result = await workerManager.execute<int>(() => _fib(43),
        priority: WorkPriority.high);
    return result;
  }

  static String _mix(String subMap, String text) {
    try {
      return Mixer(Substitutions.fromString(subMap)).mix(text);
    } catch (e) {
      return text;
    }
  }

  static int _fib(int n) {
    if (n < 2) {
      return n;
    }
    return _fib(n - 2) + _fib(n - 1);
  }
}

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
  static List<String> divide(String? text, int partLength) {
    if (text == null) return [];

    var document = parse(text);
    int currentLength = 0;
    List<String> result = [];
    while (document.nodes.isNotEmpty) {
      dom.Node current = document.clone(false);
      var partData =
          _getPart(PartData(document, partLength, current, currentLength));
      result.add((partData.current as dom.Document).outerHtml);
      document = partData.source as dom.Document;
    }

    return result;
  }

  static PartData _getPart(PartData data) {
    final iterator = [...data.source.nodes];

    for (var child in iterator) {
      if ((child.nodeType == 3) && ((child as dom.Text).data != '')) {
        final linesList = child.data.split('\n');
        final wordList = <String>[];
        for (var line in linesList) {
          var currentWordList = line.split(' ');
          for (var word in currentWordList) {
            if (word == '') continue;
            wordList.add(word);
            wordList.add(' ');
          }
          if (wordList.isNotEmpty) wordList.removeLast();
          wordList.add('\n');
        }
        wordList.removeLast();

        String currentText = '';
        String nextText = '';
        for (var word in wordList) {
          if (data.currentLength < data.partLength) {
            currentText += word;
            data.currentLength++;
          } else {
            nextText += word;
          }
        }

        var currentChild = child.clone(true);
        if (nextText == '') {
          data.source.nodes.remove(child);
        } else {
          currentChild.data = currentText;
          child.data = nextText;
        }
        data.current.nodes.add(currentChild);

        if (data.currentLength >= data.partLength) break;
      } else if (child.nodes.isEmpty) {
        data.current.nodes.add(child.clone(true));
        data.source.nodes.remove(child);
      } else {
        var currentChild = child.clone(false);
        var partData = _getPart(
            PartData(child, data.partLength, currentChild, data.currentLength));
        data.current.nodes.add(changeEmphasis(partData.current));
        data.currentLength = partData.currentLength;
        if (data.currentLength < data.partLength) {
          data.source.nodes.remove(child);
        } else {
          child = partData.source;
          break;
        }
      }
    }

    return data;
  }

  static dom.Node changeEmphasis(dom.Node source) {
    if (source is dom.Element) {
      if (source.localName == 'emphasis') {
        var outerHTML = source.outerHtml
            .replaceAll('<emphasis>', '<em>')
            .replaceAll('</emphasis>', '</em>');

        var result = dom.Element.html(outerHTML);
        return result;
      } else {
        return source;
      }
    } else {
      return source;
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

class PartData {
  dom.Node source;
  int partLength;
  dom.Node current;
  int currentLength;

  PartData(this.source, this.partLength, this.current, this.currentLength);
}
