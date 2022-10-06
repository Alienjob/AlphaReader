import 'package:AlphaReader/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:AlphaReader/features/core/data/user_data_repository.dart';

class OpenBook {
  final IUserDataRepository repository;
  final ReaderBloc readerBloc;

  OpenBook({required this.readerBloc, required this.repository});

  void call(bookKey) async {
    // push event to reader bloc for open book
    readerBloc.add(ReaderEventOpenBook(
      bookKey: bookKey,
    ));

    // save user choose for book
    repository.setBook(bookKey);
  }
}
