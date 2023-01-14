import 'dart:async';

import 'package:alpha_reader/features/purchase/purchase_repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ad_mob_event.dart';
part 'ad_mob_state.dart';

class AdMobBloc extends Bloc<AdMobEvent, AdMobState> {
  final IPurshaseRepository _repository;
  AdMobBloc(this._repository) : super(const AdMobInitial()) {
    on<AdMobEventInit>((event, emit) async {
      _repository.streamController().stream.listen(((repositoryEvent) async {
        await _handler(repositoryEvent, emit);
      }));
    });
  }

  Future<void> _handler(StoreData status, Emitter<AdMobState> emit) async {
    if (status.available == true) {
      emit(AdMobState(status.adFree == StoreDataPurchaseStatus.purchased));
    } else {
      emit(const AdMobState(false));
    }
  }
}
