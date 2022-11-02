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
  final AlphaReaderFont font;
  final FontSize fontSize;
  final SubstitutionSet set;

  final bool showUI;
  final String title;
  final String pageText;
  final int pageIndex;
  final int pageCount;
  final Substitutions sub;
  final IBook book;
  final String bookmark;

  ReaderLoaded({
    required this.font,
    required this.fontSize,
    required this.set,
    required this.showUI,
    required this.title,
    required this.pageText,
    required this.pageIndex,
    required this.pageCount,
    required this.sub,
    required this.book,
    required this.bookmark,
  });

  ReaderLoaded copyWith({
    bool? showUI,
    String? title,
    AlphaReaderFont? font,
    FontSize? fontSize,
    SubstitutionSet? set,
    String? pageText,
    int? pageIndex,
    int? pageCount,
    Substitutions? sub,
    IBook? book,
    String? bookmark,
  }) {
    return ReaderLoaded(
      showUI: showUI ?? this.showUI,
      title: title ?? this.title,
      pageText: pageText ?? this.pageText,
      pageIndex: pageIndex ?? this.pageIndex,
      pageCount: pageCount ?? this.pageCount,
      sub: sub ?? this.sub,
      book: book ?? this.book,
      font: font ?? this.font,
      fontSize: fontSize ?? this.fontSize,
      set: set ?? this.set,
      bookmark: bookmark ?? this.bookmark,
    );
  }

  @override
  List<Object?> get props => [
        font,
        fontSize,
        set,
        showUI,
        title,
        pageText,
        pageIndex,
        pageCount,
        sub,
        book,
        bookmark,
      ];
}
