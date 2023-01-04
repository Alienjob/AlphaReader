import 'package:alpha_reader/features/core/data/user_data_repository.dart';

class SaveOffset {
  final IUserDataRepository repository;

  SaveOffset({required this.repository});

  Future<void> call({
    required bookKey,
    required pageIndex,
    required double offset,
  }) async {
    // save user choose for book
    repository.saveOffset(bookKey, pageIndex, offset);
  }
}
