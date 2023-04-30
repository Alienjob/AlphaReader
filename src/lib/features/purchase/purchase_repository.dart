import 'dart:async';

import 'package:alpha_reader/features/purchase/bloc/purchases_configuration.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:flutter/services.dart';

import 'package:purchases_flutter/purchases_flutter.dart';

const additionalFontsID = 'additional_fonts';
const adFreeID = 'ad_free';

abstract class IPurshaseRepository {
  Future<void> init();
  Future<void> dispose();
  Future<bool> available();
  Future<StoreData> readStatus();
  Future<bool> buy(String itemID);
  StreamController<StoreData> streamController();
}

class RevenueCatPurshaseRepository implements IPurshaseRepository {
  StoreData _storeData = StoreData.empty();
  Map<String, Package> packages = {};
  List<StreamController<StoreData>> listeners = [];

  @override
  Future<void> init() async {
    await readStatus();
    Purchases.addCustomerInfoUpdateListener(
      (customerInfo) => _updateListeners(customerInfo),
    );
  }

  @override
  Future<void> dispose() async {
    for (var l in listeners) {
      await l.close();
    }
  }

  void _updateListeners(CustomerInfo info) {
    _updateStoreData(info);
    for (var l in listeners) {
      l.add(_storeData);
    }
  }

  void _updateStoreData(CustomerInfo info) {
    final adFreeInfo = info.entitlements.all[adFreeID];
    final additionalFontsInfo = info.entitlements.all[additionalFontsID];
    if ((adFreeInfo != null) && (adFreeInfo.isActive)) {
      _storeData = _storeData.copyWith(
        adFree: StoreDataPurchaseStatus.purchased,
      );
    }
    if ((additionalFontsInfo != null) && (additionalFontsInfo.isActive)) {
      _storeData = _storeData.copyWith(
        fonts: StoreDataPurchaseStatus.purchased,
      );
    }
    _storeData = _debugMode();
  }

  @override
  Future<bool> available() async {
    bool isConfigured = await Purchases.isConfigured;
    if (!isConfigured) {
      await Purchases.configure(
          PurchasesConfiguration(AlphaReaderPurchasesConfiguration.apiKey));
      isConfigured = await Purchases.isConfigured;
    }
    _storeData = _storeData.copyWith(available: isConfigured);
    return isConfigured;
  }

  @override
  Future<StoreData> readStatus() async {
    //offerings
    try {
      var isAvalable = await available();
      if (isAvalable) {
        Offerings offerings = await Purchases.getOfferings();
        if (offerings.current != null &&
            offerings.current!.availablePackages.isNotEmpty) {
          var offer = offerings.current!;
          for (var package in offer.availablePackages) {
            packages[package.identifier] = package;
            if (package.identifier == adFreeID) {
              _storeData = _storeData.copyWith(
                adFree: StoreDataPurchaseStatus.purchasable,
              );
            }
            if (package.identifier == additionalFontsID) {
              _storeData = _storeData.copyWith(
                fonts: StoreDataPurchaseStatus.purchasable,
              );
            }
          }
        }
      } else {
        return StoreData.empty();
      }
    } on PlatformException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }

    //getCustomerInfo
    CustomerInfo info = await Purchases.getCustomerInfo();
    _updateListeners(info);
    return _storeData;
  }

  @override
  Future<bool> buy(String itemID) async {
    try {
      if (packages[itemID] == null) return false;
      CustomerInfo customerInfo =
          await Purchases.purchasePackage(packages[itemID]!);
      if (customerInfo.entitlements.all[itemID] == null) return false;
      _updateListeners(customerInfo);
      return customerInfo.entitlements.all[itemID]!.isActive;
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e);
      }
      return false;
    }
  }

  @override
  StreamController<StoreData> streamController() {
    final c = StreamController<StoreData>();
    listeners.add(c);
    return c;
  }

  bool debugMode() {
    // Отключаем рекламу до релиза.
    if (DateTime.now().compareTo(DateTime.parse('2023-06-01')) > 0) {
      return false;
    }
    return true;
  }

  StoreData _debugMode() {
    // Отключаем рекламу до релиза.
    if (debugMode()) {
      return _storeData.copyWith(
        adFree: StoreDataPurchaseStatus.purchased,
        fonts: StoreDataPurchaseStatus.purchased,
      );
    } else {
      return _storeData;
    }
  }
}
