import 'dart:async';

import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

const additionalFontsID = 'additional_fonts';
const adFreeID = 'ad_free';
const _productIds = {additionalFontsID, adFreeID};

typedef PurchaseStatusHandler = void Function(StoreData data);

abstract class IPurshaseRepository {
  Future<PurshaseRepository> instance({
    required PurchaseStatusHandler purchaseErrorHandler,
    required PurchaseStatusHandler purchasePendingHandler,
    required PurchaseStatusHandler purchaseCompleteHandler,
  });
}

class PurshaseRepository implements IPurshaseRepository {
  final InAppPurchase _connection;
  final StreamSubscription<List<PurchaseDetails>> _subscription;
  final List<ProductDetails> _products;

  final PurchaseStatusHandler purchaseErrorHandler;
  final PurchaseStatusHandler purchasePendingHandler;
  final PurchaseStatusHandler purchaseCompleteHandler;

  StoreData data = StoreData.empty();

  bool get available => data.available;

  PurshaseRepository._(
    this._connection,
    this._subscription,
    this._products,
    this.purchaseErrorHandler,
    this.purchasePendingHandler,
    this.purchaseCompleteHandler,
    this.data,
  );

  @override
  Future<PurshaseRepository> instance({
    required PurchaseStatusHandler purchaseErrorHandler,
    required PurchaseStatusHandler purchasePendingHandler,
    required PurchaseStatusHandler purchaseCompleteHandler,
  }) async {
    //! saved shop data
    data = StoreData.empty();

    final connection = InAppPurchase.instance;
    final purchaseUpdated = InAppPurchase.instance.purchaseStream;
    final subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });

    List<ProductDetails> products = [];
    final bool available = await connection.isAvailable();
    if (!available) {
      return PurshaseRepository._(
          connection,
          subscription,
          products,
          purchaseErrorHandler,
          purchasePendingHandler,
          purchaseCompleteHandler,
          data);
    }
    data = data.copyWith(available: true);

    ProductDetailsResponse productDetailResponse =
        await _connection.queryProductDetails(_productIds);

    if (productDetailResponse.error == null) {
      products = productDetailResponse.productDetails;
      // здесь нет статусов покупки, поэтому нельзя заполнить данные
    } else {
      data = data.copyWith(error: productDetailResponse.error!.message);
    }

    return PurshaseRepository._(
      connection,
      subscription,
      products,
      purchaseErrorHandler,
      purchasePendingHandler,
      purchaseCompleteHandler,
      data,
    );
  }

  buyFreeAdSubscription() {
    if (!available) return;
    ProductDetails? product = _findProduct(adFreeID);
    if (product != null) {
      _buyProduct(product);
    }
  }

  buyAdditionalFonts() {
    if (!available) return;
    ProductDetails? product = _findProduct(additionalFontsID);
    if (product != null) {
      _buyProduct(product);
    }
  }

  void restorePurchases() async {
    if (!available) return;
    await InAppPurchase.instance.restorePurchases();
  }

  ProductDetails? _findProduct(String id) {
    final products = _products.where((element) => (element.id == id)).toList();
    if (products.isEmpty) {
      print('products not loaded');
      return null;
    }
    return products[0];
  }

  _buyProduct(ProductDetails productDetails) {
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    _connection.buyNonConsumable(purchaseParam: purchaseParam);
  }

  _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.productID == adFreeID) {
        data = data.copyWith(
          adFree: storeDataPurchaseStatus(purchaseDetails),
        );
      }
      if (purchaseDetails.productID == additionalFontsID) {
        data = data.copyWith(
          fonts: storeDataPurchaseStatus(purchaseDetails),
        );
      }

      if (purchaseDetails.status == PurchaseStatus.pending) {
        purchasePendingHandler(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        // show error message or failure icon
        purchaseErrorHandler(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.purchased) {
        // show success message and deliver the product.
        purchaseCompleteHandler(purchaseDetails);
        _connection.completePurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.restored) {
        // show success message and deliver the product.
        purchaseCompleteHandler(purchaseDetails);
        _connection.completePurchase(purchaseDetails);
      }
    });
  }

  StoreDataPurchaseStatus storeDataPurchaseStatus(
      PurchaseDetails purchaseDetails) {
    return (purchaseDetails.status == PurchaseStatus.pending)
        ? StoreDataPurchaseStatus.pending
        : (purchaseDetails.status == PurchaseStatus.purchased)
            ? StoreDataPurchaseStatus.purchased
            : StoreDataPurchaseStatus.unavalable;
  }
}
