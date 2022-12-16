import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:alpha_reader/features/purchase/purchase_repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'font_event.dart';
part 'font_state.dart';
part 'font_bloc.freezed.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final FontRepositary _fontRepositary;

  FontBloc(this._fontRepositary) : super(FontState.initial()) {
    //! INIT
    on<FontEventInit>((event, emit) async {
      emit(state.copyWith(isProcessing: true));

      //shop
      final PurshaseRepository _purshaseRepository =
          PurshaseRepository.instance(purchaseCompleteHandler: ,purchaseErrorHandler: ,purchasePendingHandler: )

      //fonts
      await _fontRepositary.init();
      var fonts = await _fontRepositary.all();
      emit(state.copyWith(
        isProcessing: false,
        fonts: fonts,
      ));
    });

    //! SELECT
    on<FontEventSelect>((event, emit) async {
      emit(state.copyWith(isProcessing: true));
      await _fontRepositary.select(event.family);
      var fonts = await _fontRepositary.all();
      emit(state.copyWith(
        isProcessing: false,
        fonts: fonts,
      ));
    });

    //! BUY
    on<FontEventBuy>((event, emit) async {
      emit(state.copyWith(isProcessing: true));
      await _fontRepositary.buy(event.family);
      var fonts = await _fontRepositary.all();
      emit(state.copyWith(
        isProcessing: false,
        fonts: fonts,
      ));
    });

  }
  //! HANDLERS
  void purchaseCompleteHandler(PurchaseDetails details, Emitter<FontState> emit) async {
    emit(state.copyWith(isProcessing: true));
  }
  void purchaseErrorHandler(PurchaseDetails details, Emitter<FontState> emit) async {
    emit(state.copyWith(isProcessing: true));
  }
  void purchasePendingHandler(PurchaseDetails details, Emitter<FontState> emit) async {
    emit(state.copyWith(isProcessing: true));
  }
}
