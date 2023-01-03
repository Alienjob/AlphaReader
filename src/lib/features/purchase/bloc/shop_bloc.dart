import 'package:alpha_reader/features/purchase/purchase_repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_event.dart';
part 'shop_state.dart';
part 'shop_bloc.freezed.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final IPurshaseRepository _purshaseRepository;

  //init
  ShopBloc(this._purshaseRepository) : super(ShopState.init()) {
    on<ShopEventInit>((event, emit) async {
      emit(state.copyWith(isProcessing: true));

      var newstate = ShopState.init();

      //available
      final available = await _purshaseRepository.available();
      if (!available) {
        emit(newstate);
        return;
      }

      final data = await _purshaseRepository.readStatus();
      newstate = newstate.copyWith(data: data);

      emit(newstate);
    });

    on<ShopEventBuy>((event, emit) async {
      emit(state.copyWith(isProcessing: true));

      //available
      final available = await _purshaseRepository.available();
      if (!available) {
        emit(state.copyWith(
          isProcessing: false,
          message: 'Магазин не доступен',
        ));
        return;
      }

      var success = await _purshaseRepository.buy(event.itemCode);
      if (success) {
        final data = await _purshaseRepository.readStatus();
        emit(state.copyWith(
          data: data,
          isProcessing: false,
        ));
      } else {
        emit(state.copyWith(
          message: 'Ошибка при покупке',
          isProcessing: false,
        ));
      }
    });
  }
}
