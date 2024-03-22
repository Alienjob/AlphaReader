import 'package:alpha_reader/domain/entities/font_size.dart';
import 'package:alpha_reader/features/core/data/user_data_repository.dart';


class ChangeFontSize {
  final IUserDataRepository repository;
  final FontSize size;

  ChangeFontSize({required this.size, required this.repository});

  Future<void> call() async {
    await repository.setFontSize(size: size);
  }
}
