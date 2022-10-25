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

    expect(mixer.mix(html), equals(result));
  });

  test('EN mixer substitute characters in simple html', () {
    var html = '<html><head></head><body>abcdefj</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;

    expect(mixer.mix(html), equals(result));
  });

  test('EN mixer substitute characters in mixin html', () {
    var html = '<html><head></head><body><p>abc</p>defj</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body><p>აბს</p>დეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;

    expect(mixer.mix(html), equals(result));
  });
  test('RU mixer substitute characters in plain string', () {
    var html = 'абсдефж';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;

    expect(mixer.mix(html), equals(result));
  });

  test('RU mixer substitute characters in simple html', () {
    var html = '<html><head></head><body>абсдефж</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body>აბსდეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;

    expect(mixer.mix(html), equals(result));
  });

  test('RU mixer substitute characters in mixin html', () {
    var html = '<html><head></head><body><p>абс</p>дефж</body></html>';
    var sub = Substitutions.all();
    var result = '<html><head></head><body><p>აბს</p>დეფჟ</body></html>';

    var mixer = Mixer(sub);
    mixer.useRandom = false;

    expect(mixer.mix(html), equals(result));
  });
}
