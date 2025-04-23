import '/features/core/data/user_data_repository.dart';
import '/features/fonts/repository.dart';

class ChangeFontFamily {
  final IUserDataRepository repository;
  final AlphaReaderFont alphaReaderFont;

  ChangeFontFamily({required this.alphaReaderFont, required this.repository});

  Future<void> call() async {
    await repository.setFontFamily(family: alphaReaderFont.family);
  }
}
