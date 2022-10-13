import 'package:alpha_reader/features/core/data/user_data_repository.dart';

class ChooseBook {
  final IUserDataRepository repository;

  ChooseBook({required this.repository});

  Future<void> call({
    required String bookKey,
  }) async {
    await repository.setBook(bookKey: bookKey);
  }
}
