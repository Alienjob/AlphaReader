import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'font_event.dart';
part 'font_state.dart';
part 'font_bloc.freezed.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final FontRepositary _repositary;
  FontBloc(this._repositary) : super(FontState.initial()) {
    on<FontEventInit>((event, emit) async {
      emit(state.copyWith(isProcessing: true));
      await _repositary.init();
      var _fonts = await _repositary.all();
      emit(state.copyWith(
        isProcessing: false,
        fonts: _fonts,
      ));
    });
    on<FontEventSelect>((event, emit) async {
      emit(state.copyWith(isProcessing: true));
      await _repositary.select(event.family);
      var _fonts = await _repositary.all();
      emit(state.copyWith(
        isProcessing: false,
        fonts: _fonts,
      ));
    });
    on<FontEventBuy>((event, emit) async {
      emit(state.copyWith(isProcessing: true));
      await _repositary.buy(event.family);
      var _fonts = await _repositary.all();
      emit(state.copyWith(
        isProcessing: false,
        fonts: _fonts,
      ));
    });
  }
}
