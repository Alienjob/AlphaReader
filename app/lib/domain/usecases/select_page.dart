import '/features/core/data/user_data_repository.dart';

class SelectPage {
  final IUserDataRepository repository;

  SelectPage({required this.repository});

  void call({required bookKey, required pageIndex}) async {
    // save user choose for book
    repository.setPageIndex(bookKey, pageIndex);
  }
}
