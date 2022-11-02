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

class ReaderEventNextFont implements ReaderEvent {}

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
