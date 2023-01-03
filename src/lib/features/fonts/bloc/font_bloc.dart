import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:alpha_reader/features/purchase/purchase_repository.dart';
import 'package:alpha_reader/features/purchase/store_data.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'font_event.dart';
part 'font_state.dart';
part 'font_bloc.freezed.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final FontRepositary _fontRepositary;
  final IPurshaseRepository _shopRepositary;

  FontBloc(this._fontRepositary, this._shopRepositary)
      : super(FontState.initial()) {
    //! INIT
    on<FontEventInit>((event, emit) async {
      emit(state.copyWith(isProcessing: true));

      //fonts
      await _fontRepositary.init();
      var fonts = await _fontRepositary.all();
      var newState = state.copyWith(
        isProcessing: false,
        fonts: fonts,
      );

      //shop data
      newState =
          newState.copyWith(storeData: await _shopRepositary.readStatus());
      emit(newState);
    });
  }
}
