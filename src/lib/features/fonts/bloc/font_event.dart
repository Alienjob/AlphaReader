part of 'font_bloc.dart';

@immutable
abstract class FontEvent {}

class FontEventInit implements FontEvent {}

class FontEventSelect implements FontEvent {
  final String family;

  FontEventSelect(this.family);
}

class FontEventBuy implements FontEvent {
  final String family;

  FontEventBuy(this.family);
}
