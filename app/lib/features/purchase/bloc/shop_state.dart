part of 'shop_bloc.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState({
    required bool isProcessing,
    required String message,
    required StoreData data,
  }) = _ShopState;

  factory ShopState.init() {
    return ShopState(
      isProcessing: false,
      message: '',
      data: StoreData.empty(),
    );
  }
}
