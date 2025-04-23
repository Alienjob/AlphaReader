part of 'font_bloc.dart';

@freezed
class FontState with _$FontState {
  const factory FontState({
    required bool isProcessing,
    required String message,
    required List<FontDescription> fonts,
    required StoreData storeData,
  }) = _FontState;
  factory FontState.initial() {
    return FontState(
      isProcessing: false,
      message: '',
      fonts: [],
      storeData: StoreData.empty(),
    );
  }
}
