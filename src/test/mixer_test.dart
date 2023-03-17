// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:alpha_reader/mixer/mixer.dart';
import 'package:test/test.dart';

void main() {
  test('EN mixer substitute characters in plain string', () {
    var html = 'abcdefj';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = false;

    expect(mixer.mix(html), equals(result));
  });

  test('EN mixer substitute characters in simple html', () {
    var html = '<html><head></head><body>abcdefj</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = false;

    expect(mixer.mix(html), equals(result));
  });

  test('EN mixer substitute characters in mixin html', () {
    var html = '<html><head></head><body><p>abc</p>defj</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body><p>აბს</p>დეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = false;

    expect(mixer.mix(html), equals(result));
  });
  test('RU mixer substitute characters in plain string', () {
    var html = 'абсдефж';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = false;

    expect(mixer.mix(html), equals(result));
  });

  test('RU mixer substitute characters in simple html', () {
    var html = '<html><head></head><body>абсдефж</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = false;

    expect(mixer.mix(html), equals(result));
  });

  test('RU mixer substitute characters in mixin html', () {
    var html = '<html><head></head><body><p>абс</p>дефж</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body><p>აბს</p>დეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = false;

    expect(mixer.mix(html), equals(result));
  });

  test('RU wrapper is wrap', () {
    var html = '<html><head></head><body><p>абс</p>дефж</body></html>';
    var sub = Substitutions.all();
    var etalon =
        '<html><head></head><body><p><a id="id1">აბს</a></p><a id="id2">დეფჟ</a></body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = true;
    var result = mixer.mix(html);

    expect(result, equals(etalon));
  });

  test('RU wrapper is deviding by space', () {
    var html = '<html><head></head><body><p>абс</p>де фж</body></html>';
    var sub = Substitutions.all();
    var etalon = '<html><head></head><body>'
        '<p><a id="id1">აბს</a></p>'
        '<a id="id2">დე</a>'
        '<a id="id3"> </a>'
        '<a id="id4">ფჟ</a>'
        '</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = true;
    var result = mixer.mix(html);

    expect(result, equals(etalon));
  });

  test('RU wrapper is deviding by space reverse input', () {
    var html = '<html><head></head><body>де фж<p>абс</p></body></html>';
    var sub = Substitutions.all();
    var etalon = '<html><head></head><body>'
        '<a id="id1">დე</a>'
        '<a id="id2"> </a>'
        '<a id="id3">ფჟ</a>'
        '<p><a id="id4">აბს</a></p>'
        '</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;
    mixer.useAncors = true;
    var result = mixer.mix(html);

    expect(result, equals(etalon));
  });

  test('divide little input', () {
    var html = '<html><head></head><body>a b c</body></html>';
    var etalon = [
      '<html><head></head><body>a b c</body></html>',
    ];

    var result = Mixer.divide(html, 10);
    expect(result.length, equals(etalon.length));
    for (int i = 0; i < result.length; i++) {
      expect(result[i], equals(etalon[i]));
    }
  });

  test('divide big input', () {
    var html = '<html><head></head><body>a b c d e f g i</body></html>';
    var etalon = [
      '<html><head></head><body>a b c</body></html>',
      '<html><body>d e f</body></html>',
      '<html><body> g i</body></html>',
    ];

    var result = Mixer.divide(html, 5);
    expect(result.length, equals(etalon.length));
    for (int i = 0; i < result.length; i++) {
      expect(result[i], equals(etalon[i]));
    }
  });

  test('divide middle input', () {
    var html = '<html><head></head><body>'
        '<p>abc def</p>'
        '<p>abc def</p>'
        '<p>abc def</p>'
        '</body></html>';
    var etalon = [
      '<html><head></head><body><p>abc def</p><p>abc </p></body></html>',
      '<html><body><p>def</p><p>abc def</p></body></html>',
    ];

    var result = Mixer.divide(html, 5);
    expect(result.length, equals(etalon.length));
    for (int i = 0; i < result.length; i++) {
      expect(result[i], equals(etalon[i]));
    }
  });

  test('divide mixed input', () {
    var html = '<html><head></head><body>'
        '<p>abc <b>def</b></p>'
        '<p>abc <b>def</b></p>'
        '<p>abc <b>def</b></p>'
        '</body></html>';
    var etalon = [
      '<html><head></head><body><p>abc <b>def</b></p><p>abc <b>def</b></p><p>abc </p></body></html>',
      '<html><body><p><b>def</b></p></body></html>',
    ];

    var result = Mixer.divide(html, 5);
    expect(result.length, equals(etalon.length));
    for (int i = 0; i < result.length; i++) {
      expect(result[i], equals(etalon[i]));
    }
  });
  test('divide change emphasis', () {
    var html = '<html><head></head><body>'
        '<p>abc <emphasis>def</emphasis></p>'
        '<p>abc <emphasis>def</emphasis></p>'
        '<p>abc <emphasis>def</emphasis></p>'
        '</body></html>';
    var etalon = [
      '<html><head></head><body><p>abc <em>def</em></p><p>abc <em>def</em></p><p>abc </p></body></html>',
      '<html><body><p><em>def</em></p></body></html>',
    ];

    var result = Mixer.divide(html, 5);
    expect(result.length, equals(etalon.length));
    for (int i = 0; i < result.length; i++) {
      expect(result[i], equals(etalon[i]));
    }
  });
}
