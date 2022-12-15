part of 'font_bloc.dart';

@freezed
class FontState with _$FontState {
  const factory FontState({
    required bool isProcessing,
    required String message,
    required List<FontDescription> fonts,
  }) = _FontState;
  factory FontState.initial() {
    return const FontState(
      isProcessing: false,
      message: '',
      fonts: [],
    );
  }
}
