import 'package:alpha_reader/domain/entities/book.dart';
import 'package:alpha_reader/domain/entities/font_size.dart';
import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:alpha_reader/domain/usecases/change_font_size.dart';
import 'package:alpha_reader/domain/usecases/change_font_family.dart';
import 'package:alpha_reader/domain/usecases/change_sub.dart';
import 'package:alpha_reader/domain/usecases/mix_done.dart';
import 'package:alpha_reader/domain/usecases/select_page.dart';
import 'package:alpha_reader/domain/usecases/set_book_mark.dart';
import 'package:alpha_reader/domain/usecases/save_offset.dart';
import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:alpha_reader/features/reader/data/reader_repository.dart';
import 'package:alpha_reader/mixer/mixer.dart';
import 'package:alpha_reader/features/core/data/user_data_repository.dart';

part 'reader_event.dart';
part 'reader_state.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  static const int MAX_AWAITING_SECONDS = 10;
  ReaderBloc() : super(ReaderInitial()) {
    on<ReaderEventOpenBook>(_onReaderEventOpenBook);
    on<ReaderEventChoosePage>(_onReaderEventChoosePage);
    on<ReaderEventShowHideUI>(_onReaderEventShowHideUI);
    on<ReaderEventOnOffSubstitution>(_onReaderEventOnOffSubstitution);
    on<ReaderEventNextPage>(_onReaderEventNextPage);
    on<ReaderEventPreviousPage>(_onReaderEventPreviousPage);
    on<ReaderEventNextSet>(_onReaderEventNextSet);
    on<ReaderEventIncreaseFontSize>(_onReaderEventIncreaseFontSize);
    on<ReaderEventDecreaseFontSize>(_onReaderEventDecreaseFontSize);
    on<ReaderEventSetBookmark>(_onReaderEventSetBookmark);
    on<ReaderEventSetOffset>(_onReaderEventSetOffset);
    on<ReaderEventSaveOffset>(_onReaderEventSaveOffset);
    on<ReaderEventSelectFont>(_onReaderEventSelectFont);
    on<ReaderEventMixDone>(_onReaderEventMixDone);
  }

  void _onReaderEventOpenBook(
    ReaderEventOpenBook event,
    Emitter<ReaderState> emit,
  ) async {
    emit(ReaderLoading());
    FontSize fontSize = await sl<IUserDataRepository>().fontSize();
    String fontFamily = await sl<IUserDataRepository>().fontFamily();

    IBook book = await sl<IReaderRepository>().getBook(event.bookKey);
    int pageIndex = await sl<IUserDataRepository>().pageIndex(event.bookKey);
    Substitutions sub = await sl<IUserDataRepository>().substitutions();
    String bookmark =
        await sl<IUserDataRepository>().bookMark(book.key, pageIndex);
    double offset = await sl<IUserDataRepository>().offset(book.key, pageIndex);
    //double offset = 0;

    int start = DateTime.now().millisecondsSinceEpoch;
    while (!book.ready) {
      await Future.delayed(const Duration(milliseconds: 100));
      if ((DateTime.now().millisecondsSinceEpoch - start) / 1000 >
          MAX_AWAITING_SECONDS) {
        emit(ReaderLoaded(
          sub: sub,
          book: book,
          showUI: false,
          title: book.title,
          pageIndex: pageIndex,
          pageCount: book.length,
          pageText: 'Не удалось загрузить данные книги',
          font: AlphaReaderFont(fontFamily),
          fontSize: fontSize,
          set: SubstitutionSet.ru,
          bookmark: bookmark,
          offset: offset,
        ));
        return;
      }
    }
    String displayText =
        await MixerExecutor.mix(sub, await book.pageText(pageIndex));
    var newState = ReaderLoaded(
      sub: sub,
      book: book,
      showUI: false,
      title: book.title,
      pageIndex: pageIndex,
      pageCount: book.length,
      pageText: displayText,
      font: AlphaReaderFont(fontFamily),
      fontSize: fontSize,
      set: SubstitutionSet.ru,
      bookmark: bookmark,
      offset: offset,
    );

    emit(newState);
  }

  void _onReaderEventShowHideUI(
    ReaderEventShowHideUI event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      var newState = (state as ReaderLoaded)
          .copyWith(showUI: !(state as ReaderLoaded).showUI);
      emit(newState);
    }
  }

  void _onReaderEventChoosePage(
    ReaderEventChoosePage event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      String displayText = await MixerExecutor.mix(
          (state as ReaderLoaded).sub,
          await (state as ReaderLoaded).book.pageText(
                event.pageIndex,
              ));
      double offset = await sl<IUserDataRepository>()
          .offset((state as ReaderLoaded).book.key, event.pageIndex);
      var newState = (state as ReaderLoaded).copyWith(
        pageIndex: event.pageIndex,
        pageText: displayText,
        offset: offset,
      );
      emit(newState);
      sl<SelectPage>()(
        bookKey: (state as ReaderLoaded).book.key,
        pageIndex: (state as ReaderLoaded).pageIndex,
      );
    }
  }

  void _onReaderEventOnOffSubstitution(
    ReaderEventOnOffSubstitution event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      var newSub = await sl<ChangeSub>()(
        subs: (state as ReaderLoaded).sub,
        substitution: event.substitution,
      );
      var newState = (state as ReaderLoaded).copyWith(
        sub: newSub,
      );
      emit(newState);

      String displayText = await MixerExecutor.mix(
          newSub,
          await (state as ReaderLoaded).book.pageText(
                (state as ReaderLoaded).pageIndex,
              ));

      add(ReaderEventMixDone(substitutions: newSub, displayText: displayText));
    }
  }

  void _onReaderEventNextPage(
    ReaderEventNextPage event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      int newPageIndex = (state as ReaderLoaded).pageIndex + 1;
      // last page assert
      if (newPageIndex == (state as ReaderLoaded).pageCount) {
        return;
      }
      add(ReaderEventChoosePage(pageIndex: newPageIndex));
    }
  }

  void _onReaderEventMixDone(
    ReaderEventMixDone event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      if (event.substitutions != (state as ReaderLoaded).sub) return;
      var newSub = await sl<MixDone>()(
        subs: (state as ReaderLoaded).sub,
      );
      var newState = (state as ReaderLoaded).copyWith(
        sub: event.substitutions,
        pageText: event.displayText,
      );
      emit(newState);
    }
  }

  void _onReaderEventPreviousPage(
    ReaderEventPreviousPage event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      int newPageIndex = (state as ReaderLoaded).pageIndex - 1;

      // first page assert
      if (newPageIndex < 0) {
        return;
      }
      add(ReaderEventChoosePage(pageIndex: newPageIndex));
    }
  }

  void _onReaderEventNextSet(
    ReaderEventNextSet event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      var newSet = ((state as ReaderLoaded).set == SubstitutionSet.en)
          ? SubstitutionSet.ru
          : SubstitutionSet.en;

      var newState = (state as ReaderLoaded).copyWith(set: newSet);
      emit(newState);
    }
  }

  void _onReaderEventSetBookmark(
    ReaderEventSetBookmark event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      var newState = (state as ReaderLoaded).copyWith(
        bookmark: event.bookmark,
      );
      emit(newState);
      await sl<SetBookMark>()(
        bookKey: newState.book.key,
        pageIndex: newState.pageIndex,
        bookMark: newState.bookmark,
      );
    }
  }

  void _onReaderEventSaveOffset(
    ReaderEventSaveOffset event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      await sl<SaveOffset>()(
        bookKey: (state as ReaderLoaded).book.key,
        pageIndex: (state as ReaderLoaded).pageIndex,
        offset: (state as ReaderLoaded).offset,
      );
    }
  }

  void _onReaderEventSetOffset(
    ReaderEventSetOffset event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      var newState = (state as ReaderLoaded).copyWith(
        offset: event.offset,
      );
      emit(newState);
    }
  }

  void _onReaderEventSelectFont(
    ReaderEventSelectFont event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      var newState = (state as ReaderLoaded).copyWith(
        font: AlphaReaderFont(event.font.family),
      );
      ChangeFontFamily(alphaReaderFont: newState.font, repository: sl())();
      emit(newState);
    }
  }

  void _onReaderEventIncreaseFontSize(
    ReaderEventIncreaseFontSize event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      FontSize newSize = FontSize.medium;
      final old = (state as ReaderLoaded).fontSize.size;
      if (old == FontSize.xxSmall.size) newSize = FontSize.xSmall;
      if (old == FontSize.xSmall.size) newSize = FontSize.small;
      if (old == FontSize.small.size) newSize = FontSize.medium;
      if (old == FontSize.medium.size) newSize = FontSize.large;
      if (old == FontSize.large.size) newSize = FontSize.xLarge;
      if (old == FontSize.xLarge.size) newSize = FontSize.xxLarge;
      if (old == FontSize.xxLarge.size) newSize = FontSize.xxLarge;
      ChangeFontSize(repository: sl(), size: newSize)();
      var newState = (state as ReaderLoaded).copyWith(fontSize: newSize);
      emit(newState);
    }
  }

  void _onReaderEventDecreaseFontSize(
    ReaderEventDecreaseFontSize event,
    Emitter<ReaderState> emit,
  ) async {
    if (state is ReaderLoaded) {
      FontSize newSize = FontSize.medium;
      final old = (state as ReaderLoaded).fontSize.size;
      if (old == FontSize.xxSmall.size) newSize = FontSize.xxSmall;
      if (old == FontSize.xSmall.size) newSize = FontSize.xxSmall;
      if (old == FontSize.small.size) newSize = FontSize.xSmall;
      if (old == FontSize.medium.size) newSize = FontSize.small;
      if (old == FontSize.large.size) newSize = FontSize.medium;
      if (old == FontSize.xLarge.size) newSize = FontSize.large;
      if (old == FontSize.xxLarge.size) newSize = FontSize.xLarge;
      ChangeFontSize(repository: sl(), size: newSize)();
      var newState = (state as ReaderLoaded).copyWith(fontSize: newSize);
      emit(newState);
    }
  }
}
