part of 'reader_bloc.dart';

@immutable
abstract class ReaderEvent {}

class ReaderEventOpenBook implements ReaderEvent {
  final String bookKey;

  ReaderEventOpenBook({
    required this.bookKey,
  });
}

class ReaderEventShowHideUI implements ReaderEvent {}

class ReaderEventNextPage implements ReaderEvent {}

class ReaderEventPreviousPage implements ReaderEvent {}

class ReaderEventChoosePage implements ReaderEvent {
  final int pageIndex;

  ReaderEventChoosePage({
    required this.pageIndex,
  });
}

class ReaderEventNextSet implements ReaderEvent {}

class ReaderEventSelectFont implements ReaderEvent {
  final FontDescription font;

  ReaderEventSelectFont(this.font);
}

class ReaderEventIncreaseFontSize implements ReaderEvent {}

class ReaderEventDecreaseFontSize implements ReaderEvent {}

class ReaderEventOnOffSubstitution implements ReaderEvent {
  final Substitution substitution;

  ReaderEventOnOffSubstitution({
    required this.substitution,
  });
}

class ReaderEventCloseBook implements ReaderEvent {}

class ReaderEventSetBookmark implements ReaderEvent {
  final String bookmark;

  ReaderEventSetBookmark(this.bookmark);
}

class ReaderEventSetOffset implements ReaderEvent {
  final double offset;

  ReaderEventSetOffset(this.offset);
}

class ReaderEventSaveOffset implements ReaderEvent {}

class ReaderEventMixDone implements ReaderEvent {
  final Substitutions substitutions;
  final String displayText;

  ReaderEventMixDone({
    required this.substitutions,
    required this.displayText,
  });
}
