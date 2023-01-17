import 'dart:async';

import 'package:alpha_reader/features/purchase/purchase_repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'ad_mob_event.dart';
part 'ad_mob_state.dart';

class AdMobBloc extends Bloc<AdMobEvent, AdMobState> {
  final IPurshaseRepository _repository;
  final GlobalKey key = GlobalKey();
  StreamController? sController;

  AdMobBloc(this._repository) : super(const AdMobInitial()) {
    on<AdMobEventInit>((event, emit) async {
      sController = _repository.streamController();
      sController!.stream.listen(((repositoryEvent) async {
        await _handler(repositoryEvent, emit);
      }));

      var status = await _repository.readStatus();
      var adFree = (status.adFree == StoreDataPurchaseStatus.purchased);
      emit(AdMobState(adFree));
    });
    on<AdMobEventTrue>((event, emit) async {
      emit(const AdMobState(true));
    });
    on<AdMobEventFalse>((event, emit) async {
      emit(const AdMobState(false));
    });
  }

  Future<void> _handler(StoreData status, Emitter<AdMobState> emit) async {
    var adFree = (status.available == true) &&
        (status.adFree == StoreDataPurchaseStatus.purchased);
    add(adFree ? AdMobEventTrue() : AdMobEventFalse());
  }
}
