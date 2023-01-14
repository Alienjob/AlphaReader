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
      print('ad log init admob $key');

      sController = _repository.streamController();
      sController!.stream.listen(((repositoryEvent) async {
        print('ad log stream listener $key');
        await _handler(repositoryEvent, emit);
      }));

      var status = await _repository.readStatus();
      var adFree = (status.adFree == StoreDataPurchaseStatus.purchased);
      emit(AdMobState(adFree));
      print('ad log _handler emit $adFree $key');
    });
    on<AdMobEventTrue>((event, emit) async {
      print('ad log AdMobEventTrue admob $key');
      emit(const AdMobState(true));
      print('ad log _handler emit true $key');
    });
    on<AdMobEventFalse>((event, emit) async {
      print('ad log AdMobEventTrue admob $key');
      emit(const AdMobState(false));
      print('ad log _handler emit false $key');
    });
  }

  Future<void> _handler(StoreData status, Emitter<AdMobState> emit) async {
    var adFree = (status.available == true) &&
        (status.adFree == StoreDataPurchaseStatus.purchased);
    add(adFree ? AdMobEventTrue() : AdMobEventFalse());
    print('ad log add event $adFree $key');
  }
}
