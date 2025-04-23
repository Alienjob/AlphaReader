part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {}

class ShopEventInit implements ShopEvent {}

class ShopEventBuy implements ShopEvent {
  final String itemCode;

  ShopEventBuy(this.itemCode);
}
