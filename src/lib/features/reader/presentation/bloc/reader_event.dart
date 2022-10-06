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

class ReaderEventOnOffSubstitution implements ReaderEvent {
  final Substitution substitution;

  ReaderEventOnOffSubstitution({
    required this.substitution,
  });
}

class ReaderEventCloseBook implements ReaderEvent {}
