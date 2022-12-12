import 'package:alpha_reader/features/core/data/user_data_repository.dart';

class SetBookMark {
  final IUserDataRepository repository;

  SetBookMark({required this.repository});

  Future<void> call({
    required bookKey,
    required pageIndex,
    required String bookMark,
  }) async {
    // save user choose for book
    repository.setBookMark(bookKey, pageIndex, bookMark);
  }
}
