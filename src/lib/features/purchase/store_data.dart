import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_data.freezed.dart';

enum StoreDataPurchaseStatus { unavalable, purchasable, pending, purchased }

@freezed
class StoreData with _$StoreData {
  const factory StoreData({
    required bool available,
    required String? error,
    required StoreDataPurchaseStatus fonts,
    required StoreDataPurchaseStatus adFree,
  }) = _StoreData;
  factory StoreData.empty() {
    return const StoreData(
      available: false,
      error: null,
      fonts: StoreDataPurchaseStatus.unavalable,
      adFree: StoreDataPurchaseStatus.unavalable,
    );
  }
}
