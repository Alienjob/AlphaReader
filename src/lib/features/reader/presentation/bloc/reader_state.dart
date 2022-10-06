part of 'reader_bloc.dart';

@immutable
abstract class ReaderState extends Equatable {}

class ReaderInitial extends ReaderState {
  @override
  List<Object?> get props => [];
}

class ReaderLoading extends ReaderState {
  @override
  List<Object?> get props => [];
}

class ReaderLoaded extends ReaderState {
  final bool showUI;
  final String title;
  final String pageText;
  final int pageIndex;
  final int pageCount;
  final Substitutions sub;
  final IBook book;

  ReaderLoaded({
    required this.showUI,
    required this.title,
    required this.pageText,
    required this.pageIndex,
    required this.pageCount,
    required this.sub,
    required this.book,
  });

  ReaderLoaded copyWith(
      {bool? showUI,
      String? title,
      String? pageText,
      int? pageIndex,
      int? pageCount,
      Substitutions? sub,
      IBook? book}) {
    return ReaderLoaded(
      showUI: showUI ?? this.showUI,
      title: title ?? this.title,
      pageText: pageText ?? this.pageText,
      pageIndex: pageIndex ?? this.pageIndex,
      pageCount: pageCount ?? this.pageCount,
      sub: sub ?? this.sub,
      book: book ?? this.book,
    );
  }

  @override
  List<Object?> get props => [
        showUI,
        title,
        pageText,
        pageIndex,
        pageCount,
        sub,
        book,
      ];
}
